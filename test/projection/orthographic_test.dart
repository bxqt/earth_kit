import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:earth_kit/earth_kit.dart';

void main() {
  final projection = Projections.orthographic
    ..size = const Size(100, 100)
    ..origin = LatLng.primeMeridian;

  dynamic round(dynamic p) {
    if (p is LatLng) {
      return LatLng(
        p.latitude.roundToDouble(),
        p.longitude.roundToDouble(),
      );
    } else if (p is Offset) {
      return Offset(
        p.dx.roundToDouble(),
        p.dy.roundToDouble(),
      );
    }
  }

  const center = Offset(50.0, 50.0);

  test('Should project the LatLng to the correct Offset', () async {
    expect(
      projection.project(LatLng.primeMeridian),
      equals(center),
    );

    expect(
      round(projection.project(const LatLng(0.0, 45.0))),
      equals(const Offset(85.0, 50.0)),
    );
  });

  test('Should invert the Offset to the correct LatLng', () {
    LatLng invert(LatLng origin, Offset offset) {
      projection.origin = origin;
      return projection.invert(offset);
    }

    expect(
      round(invert(const LatLng(0.0, 0.0), const Offset(85.4, 50.0))),
      equals(const LatLng(0.0, 45.0)),
    );

    expect(
      round(invert(const LatLng(-45.0, 170.0), center)),
      equals(const LatLng(-45.0, 170.0)),
    );

    expect(
      round(invert(const LatLng(90.0, 0.0), const Offset(50.0, 0.0))),
      equals(const LatLng(0.0, 180.0)),
    );
  });
}
