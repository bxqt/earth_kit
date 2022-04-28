import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:earth_kit/earth_kit.dart';
import 'package:earth_kit/src/canvas/open_gl_texture.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../earth.dart';
import '../earth_data.dart';
import '../model/model.dart';
import '../projection/projection.dart';
import '../util/util.dart';
import '../widgets/widgets.dart';

export 'heatmap.dart';

part 'topography.dart';
part 'lines.dart';
part 'shapes.dart';
part 'stars.dart';

abstract class Renderable {
  double get zIndex;
  bool get projectionDependent => true;
}

abstract class KRenderer extends BasePainter {
  final EarthState state;
  final EarthKit earth;
  final EarthData? data;
  final EarthTheme theme;
  final Projection projection;
  final CameraSpec cameraSpec;
  final EarthSnapshot snapshot;
  final Rect? visible;
  final BBox bounds;
  KRenderer(this.state)
      : earth = state.earth,
        data = state.data,
        theme = state.data!.theme,
        projection = state.earth.projection,
        cameraSpec = state.camera,
        snapshot = state.snapshot,
        visible = state.snapshot.visible,
        bounds = state.snapshot.bounds {
    strokeFactor = lerpDouble(0.1, 1.0, zoom! / 3.0)!.atMost(1.0);
    _visiblePath = Path()..addRect(visible!);
  }

  late Path _visiblePath;

  Topo? get topo => state.topo;
  bool get isLoaded => topo != null;

  bool get isMoving => snapshot.isMoving;

  PathMetric? clipMetrics;
  late Path clipBounds;

  LatLng get origin => cameraSpec.origin;
  double? get rotation => cameraSpec.rotation;
  double? get zoom => cameraSpec.zoom;

  late double strokeFactor;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    projection
      ..size = size
      ..origin = origin;
  }

  void clipProjection() {
    clipBounds = earth.projection.clipPath;
    clipMetrics = clipBounds.computeMetrics().firstOrNull;
    canvas.clipPath(clipBounds);
  }

  void drawProjectionOutline() {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawPath(clipBounds, paint);
  }

  void drawFill(Path? path, Color color) {
    if (color.opacity == 0) return;

    canvas.drawPath(
      path!,
      Paint()..color = color,
    );
  }

  void drawStroke(Path path, Color color, double? thickness) {
    if (color.opacity == 0.0 || thickness! <= 0.0) return;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = thickness * strokeFactor
      ..color = color;

    canvas.drawPath(path, paint);
  }

  void drawInnerShadow(Path path, Color color, double blur) {
    if (color.opacity == 0 || blur <= 0.0) return;

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 20),
    );
  }

  void drawElevation(Path? path, Color? color, double elevation) {
    if (elevation <= 0.0 || color == null || color.opacity == 0) {
      return;
    }

    canvas.drawPath(
      path!,
      Paint()
        ..color = color
        ..maskFilter = MaskFilter.blur(BlurStyle.outer, elevation),
    );
  }

  Path createPathForShapes(List<Shape> shapes, {bool clip = true}) {
    final path = Path();

    for (final shape in shapes) {
      final subPath = createPathForCoordinates(shape, clip: clip);
      path.addPath(subPath, Offset.zero);
    }

    return path;
  }

  /// Creates a Path for a list of coordinates for drawing
  /// operations on the Canvas.
  ///
  /// The path will be clipped to the great circle on globe
  /// projections. If no coordinate is contained in the visible
  /// bounds, the path will not be drawn to improve performance.
  Path createPathForCoordinates(List<LatLng> coordinates, {bool clip = true}) {
    final Path path = Path();

    LatLng? pathStart;
    LatLng? clipStart;

    bool didMove = false;
    for (final coord in coordinates) {
      if (shouldClip(coord)) {
        clipStart ??= coord;
        continue;
      } else {
        pathStart ??= coord;
      }

      final offset = project(coord);

      if (!didMove) {
        didMove = true;
        clipStart = null;
        path.moveTo(offset.dx, offset.dy);
      } else if (clipStart != null) {
        if (clip) {
          final lastOffset = project(clipStart);
          joinClippedPoints(path, lastOffset, offset);
        } else {
          path.moveTo(offset.dx, offset.dy);
        }
        clipStart = null;
      } else {
        path.lineTo(offset.dx, offset.dy);
      }
    }

    if (!clip) {
      return path;
    }

    if (clipStart != null && pathStart != null) {
      final firstVisibleOffset = project(pathStart);
      final lastVisibleOffset = project(clipStart);
      joinClippedPoints(path, lastVisibleOffset, firstVisibleOffset);
    }

    try {
      // Only draw what is actually on screen.
      // This can massively improve performance
      // when zoomed in.
      return Path.combine(
        PathOperation.intersect,
        path,
        _visiblePath,
      );
    } catch (_) {
      print(_);
      return path;
    }
  }

  Path resampledPath(List<LatLng> coordinates) {
    final knots = adaptiveResample(coordinates, project);

    if (EarthKit.debugDragAdaptiveResample && kDebugMode) {
      for (final knot in knots) {
        if (shouldClip(knot)) continue;
        canvas.drawCircle(project(knot), 2, Paint()..color = Colors.grey);
      }
    }

    return createPathForCoordinates(knots, clip: false);
  }

  List<LatLng> resample(List<LatLng> coordinates) =>
      adaptiveResample(coordinates, project);
  Offset project(LatLng coord) => projection.project(coord);
  LatLng? invert(Offset offset) => projection.invert(offset);
  bool shouldClip(LatLng coord) => projection.shouldClip(coord);
  bool inProjectionBounds(Offset offset) => projection.isInsideBounds(offset);
  void joinClippedPoints(Path path, Offset start, Offset end) =>
      projection.joinClippedPoints(path, start, end);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
