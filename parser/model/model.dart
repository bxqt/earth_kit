import 'dart:math' as math;

import 'package:meta/meta.dart';

import '../util/extensions.dart';

part 'country.dart';

double radians(double degree) => degree * (math.pi / 180.0);

class LatLng {
  final double latitude;
  final double longitude;
  LatLng(num latitude, num longitude)
      : latitude = latitude.toDouble(),
        longitude = longitude.toDouble();

  double get latitudeRad => radians(latitude);
  double get longitudeRad => radians(longitude);

  @override
  String toString() => 'C($latitude, $longitude)';
}

class Shape {
  final List<LatLng> coordinates;
  const Shape(this.coordinates);

  @override
  String toString() => 'S(${coordinates.length})';
}

class BBox {
  final LatLng bottomLeft;
  final LatLng topRight;
  const BBox(
    this.bottomLeft,
    this.topRight,
  );

  @override
  String toString() => 'BBox($bottomLeft, $topRight)';
}
