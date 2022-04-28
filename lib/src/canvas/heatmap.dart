import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;

import 'package:earth_kit/earth_kit.dart';
import 'package:earth_kit/src/canvas/open_gl_texture.dart';

import '../util/util.dart';

typedef ColorValueBuilder = Color Function(double value);

class HeatmapRenderer extends StatefulWidget with Renderable {
  final EarthState state;
  final List<Heatmap> heatmaps;
  final double index;
  HeatmapRenderer({
    Key? key,
    required this.state,
    required this.heatmaps,
    this.index = 0.0,
  })  : assert(
          heatmaps.every((h) => h.zIndex == heatmaps.first.zIndex) || heatmaps.isEmpty,
          'All heatmaps must have the same zIndex',
        ),
        assert((index >= 0.0 && index <= (heatmaps.length - 1.0)) || heatmaps.isEmpty),
        super(key: key);

  @override
  double get zIndex => heatmaps.firstOrNull?.zIndex ?? 2.0;

  @override
  bool get projectionDependent => !Platform.isAndroid;

  @override
  _HeatmapRendererState createState() => _HeatmapRendererState();
}

class _HeatmapRendererState extends State<HeatmapRenderer> {
  Size? size;

  Future<Image>? heatmapImage;
  Map<String, dynamic>? heatmapData;

  bool get isMoving => widget.state.snapshot.isMoving;

  @override
  void initState() {
    super.initState();
    postFrame(computeHeatmap);
    setHeatmapData();
  }

  @override
  void didUpdateWidget(HeatmapRenderer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!listEquals(widget.heatmaps, oldWidget.heatmaps)) {
      setHeatmapData();
    } else if (widget.index != oldWidget.index) {
      setHeatmapData(resendHeatmaps: false);
    }

    if (widget.state.snapshot.origin != oldWidget.state.snapshot.origin) {
      computeHeatmap();
    }
  }

  void setHeatmapData({bool resendHeatmaps = true}) {
    // Do not clear the heatmap on the native side so
    // we can fade the heatmap in and out.
    if (widget.heatmaps.isEmpty) return;

    final heatmap = widget.heatmaps.getOrNull(widget.index.floor());

    heatmapData = {
      'scale': heatmap?.scale.toMap(),
      'index': widget.index,
      'interpolate': heatmap?.interpolate,
      'heatmaps': resendHeatmaps ? widget.heatmaps : null,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return buildOpenGLTexture();
    } else {
      return buildCPUTexture();
    }
  }

  Widget buildOpenGLTexture() {
    return AnimatedOpacity(
      opacity: widget.heatmaps.isEmpty ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: OpenGLTexture(
        id: 'heatmap',
        state: widget.state,
        data: heatmapData,
      ),
    );
  }

  Future<void> computeHeatmap() async {
    if (!Platform.isAndroid) {
      // CPU rendering is far too slow, so don't even try to
      // render the map while moving.
      if (isMoving) {
        heatmapImage = Future.value(null);
        return;
      }

      final completer = Completer<Image>();
      heatmapImage = completer.future;

      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
      final bytes = await compute(
        decodeHeatmap,
        _Args(
          heatmap: widget.heatmaps.first,
          origin: widget.state.camera.origin,
          pixelRatio: pixelRatio,
          projection: widget.state.earth.projection,
          size: size,
          visible: widget.state.snapshot.visible,
        ),
      );

      final width = (size!.width * pixelRatio).toInt();
      final height = (size!.height * pixelRatio).toInt();

      decodeImageFromPixels(
        Uint8List.fromList(bytes),
        width,
        height,
        PixelFormat.bgra8888,
        (result) => completer.complete(result),
      );
    }
  }

  Widget buildCPUTexture() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        this.size = Size(
          size.width.truncateToDouble(),
          size.height.truncateToDouble(),
        );

        return FutureBuilder<Image>(
          future: heatmapImage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: RawImage(
                  image: snapshot.data,
                  //scale: MediaQuery.of(context).devicePixelRatio,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}

class _Args {
  final Size? size;
  final LatLng origin;
  final double pixelRatio;
  final Rect? visible;
  final Heatmap heatmap;
  final Projection projection;
  const _Args({
    required this.size,
    required this.origin,
    required this.pixelRatio,
    required this.visible,
    required this.heatmap,
    required this.projection,
  });
}

Uint8List decodeHeatmap(_Args args) {
  final size = args.size!;
  final pixelRatio = args.pixelRatio;

  final width = (size.width * pixelRatio).toInt();
  final height = (size.height * pixelRatio).toInt();

  return buildByteList(args, width, height);
}

Uint8List buildByteList(_Args args, int width, int height) {
  final Uint32List pixels = Uint32List(width * height);

  final left = args.visible!.left;
  final top = args.visible!.top;

  final pixelRatio = args.pixelRatio;
  final projection = args.projection;
  final heatmap = args.heatmap;
  final step = args.heatmap.pixelSize;

  for (var y = 0.0; y < height; y += step) {
    for (var x = 0.0; x < width; x += step) {
      final dx = (x / pixelRatio) + left;
      final dy = (y / pixelRatio) + top;

      final latLng = cacheInvert(projection, Offset(dx, dy));
      if (latLng == null) continue;

      final color = colorForLatLng(heatmap, latLng);

      for (var i = 0; i < step; i++) {
        final index = ((y + i) * width + x).toInt();

        for (var i = 0; i < step; i++) {
          if ((index + i) >= pixels.length) continue;
          pixels[index + i] = color;
        }
      }
    }
  }

  return pixels.buffer.asUint8List();
}

int colorForLatLng(Heatmap heatmap, LatLng latLng) {
  var y = heatmap.y(latLng.latitude);
  var x = heatmap.x(latLng.longitude);

  if (y % 1.0 == 0.0) {
    y -= 0.01;
  }

  if (x % 1.0 == 0.0) {
    x -= 0.01;
  }

  final tile = _Tile(
    value(heatmap, y.floorToDouble(), x.floorToDouble()),
    value(heatmap, y.floorToDouble(), x.ceilToDouble()),
    value(heatmap, y.ceilToDouble(), x.floorToDouble()),
    value(heatmap, y.ceilToDouble(), x.ceilToDouble()),
  );

  return heatmap.eval(tile.interpolate(x, y)).value;
}

_Vertex value(Heatmap heatmap, double y, double x) {
  var yIndex = y.toInt();
  var xIndex = x.toInt();

  final columns = heatmap.length;
  final columnWidth = heatmap[0].length;

  if (yIndex < 0) {
    yIndex = 0;
  } else if (yIndex >= columns) {
    yIndex = columns - 1;
  }

  if (xIndex < 0) {
    xIndex = 0;
  } else if (xIndex >= columnWidth) {
    xIndex = columnWidth - 1;
  }

  return _Vertex(heatmap[yIndex][xIndex], x, y);
}

class _Vertex {
  final double x;
  final double y;
  final double value;
  _Vertex(
    this.value,
    this.x,
    this.y,
  );
}

class _Tile {
  final _Vertex topLeft;
  final _Vertex topRight;
  final _Vertex bottomLeft;
  final _Vertex bottomRight;
  const _Tile(
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  );

  double interpolate(double dx, double dy) {
    assert(
      dx >= topLeft.x && dx <= bottomRight.x,
      '$dx not in ${[topLeft.x, bottomRight.x]}',
    );
    assert(
      dy >= topLeft.y && dy <= bottomRight.y,
      '$dy not in ${[topLeft.y, bottomRight.y]}',
    );

    final tr = topRight.x;
    final tl = topLeft.x;
    final td = tr - tl;
    final r1 = ((tr - dx / td) * topLeft.value) + ((dx - tl / td) * topRight.value);
    final r2 = ((tr - dx / td) * bottomLeft.value) + ((dx - tl / td) * bottomRight.value);

    final ty = topLeft.y;
    final by = bottomLeft.y;
    final yd = by - ty;
    return ((by - dy / yd) * r1) + ((dy - ty / yd) * r2);
  }

  @override
  String toString() {
    return 'Tile(topLeft: $topLeft, topRight: $topRight, bottomLeft: $bottomLeft, bottomRight: $bottomRight)';
  }
}
