import 'dart:ffi' hide Size;
import 'dart:io' show Platform;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/rendering.dart';

import '../model/model.dart';
import '../util/util.dart';

part 'equirectangular.dart';
part 'mercator.dart';
part 'orthographic.dart';

Map<LatLng, Offset> _projectCache = {};
Map<Offset, LatLng?> _invertCache = {};

Offset? cacheProject(Projection projection, LatLng latLng) {
  if (_projectCache.containsKey(latLng)) {
    return _projectCache[latLng];
  }

  final offset = projection.project(latLng);
  _projectCache[latLng] = offset;
  return offset;
}

LatLng? cacheInvert(Projection projection, Offset point) {
  if (_invertCache.containsKey(point)) {
    return _invertCache[point];
  }

  final latLng = projection.invert(point);
  _invertCache[point] = latLng;
  return latLng;
}

void clearProjectionCache() {
  _projectCache.clear();
  _invertCache.clear();
}

abstract class Projection {
  Size? size;

  late LatLng _origin;
  LatLng get origin => _origin;
  double get lat0 => _origin.latitude;
  double get lon0 => _origin.longitude;
  set origin(LatLng value) => _origin = LatLng(value.latitudeRad, value.longitudeRad);

  double get aspectRatio;
  bool get isGlobe => false;

  Offset project(LatLng latLng);
  LatLng? invert(Offset point);

  List<double> distortion(Offset point, [LatLng? latLng]) {
    latLng ??= invert(point);

    final latitude = latLng!.latitude;
    final longitude = latLng.longitude;

    const H = 0.0000360; // 0.0000360°φ ~= 4m

    final hLat = latitude < 0 ? H : -H;
    final hLon = longitude < 0 ? H : -H;
    final pLat = project(LatLng(latitude + hLat, longitude));
    final pLon = project(LatLng(latitude, longitude + hLon));

    final k = cos(latitude / 360.0 * (2 * pi));

    return [
      (pLon.dx - point.dx) / hLon / k,
      (pLon.dy - point.dy) / hLon / k,
      (pLat.dx - point.dx) / hLat,
      (pLat.dy - point.dy) / hLat,
    ];
  }

  Path get clipPath => Path()..addRect(Rect.fromLTRB(0, 0, size!.width, size!.height));

  bool shouldClip(LatLng latLng) => false;
  void joinClippedPoints(Path path, Offset start, Offset end) {}

  bool isInsideBounds(Offset offset) => size!.contains(offset);
  bool areInsideBounds(List<Offset> offsets) => offsets.every(isInsideBounds);

  @override
  // ignore: hash_and_equals
  bool operator ==(Object o) => o.runtimeType == runtimeType;
}

abstract class Projections {
  static final Orthographic orthographic = Orthographic._();
  static final Mercator mercator = Mercator._();
  static final Equirectangular equirectangular = Equirectangular._();
  static final List<Projection> values = [
    orthographic,
    mercator,
    equirectangular,
  ];
}

class ProjectionDistortion {
  final Offset latitude;
  final Offset longitude;
  const ProjectionDistortion(this.latitude, this.longitude);
}
