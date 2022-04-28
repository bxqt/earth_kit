import 'dart:ui';

import 'package:flutter/material.dart';

import 'lat_lng/lat_lng.dart';
import 'model.dart';
import 'polygon.dart';

class Graticule extends Polyline {
  const Graticule._(
    List<LatLng> coordinates, {
    Color? color,
    double? strokeWidth,
  })  : assert(coordinates.length == 2),
        super(
          coordinates: coordinates,
          color: color,
          strokeWidth: strokeWidth,
        );

  factory Graticule.horizontal(
    double latitude, {
    Color? color,
    double? strokeWidth,
  }) {
    return Graticule._(
      [LatLng(latitude, -179.5), LatLng(latitude, 180.0)],
      color: color,
      strokeWidth: strokeWidth,
    );
  }

  factory Graticule.vertical(
    double longitude, {
    double maxLatitude = 80.0,
    double minLatitude = -80.0,
    Color? color,
    double? strokeWidth,
  }) {
    return Graticule._(
      [LatLng(maxLatitude, longitude), LatLng(minLatitude, longitude)],
      color: color,
      strokeWidth: strokeWidth,
    );
  }

  static List<Graticule> grid({
    int verticalCount = 36,
    int horizontalCount = 19,
    double minLatitude = -85.0,
    double maxLatitude = 85.0,
    bool addCross = true,
  }) {
    assert(verticalCount > 0 && horizontalCount > 0);
    assert(minLatitude <= maxLatitude);

    final List<Graticule> result = [];

    double? mnl;
    double? mxl;

    for (var y = 1; y <= horizontalCount; y++) {
      final step = (maxLatitude - minLatitude) / horizontalCount;
      final translation = minLatitude - (step / 2);
      final latitude = (y * step) + translation;

      if (mnl == null || latitude < mnl) mnl = latitude;
      if (mxl == null || latitude > mxl) mxl = latitude;

      result.add(
        Graticule.horizontal(latitude),
      );
    }

    for (var x = 0; x < verticalCount; x++) {
      final step = 360.0 / verticalCount;
      final longitude = (x * step) - 180.0;
      result.add(
        Graticule.vertical(
          longitude,
          maxLatitude: mxl!,
          minLatitude: mnl!,
        ),
      );
    }

    if (addCross && verticalCount >= 4 && verticalCount.isEven) {
      for (var i = 0; i < 4; i++) {
        const step = 360.0 / 4;
        final longitude = (i * step) - 180.0;
        result.addAll([
          Graticule.vertical(
            longitude,
            maxLatitude: 90.0,
            minLatitude: mxl!,
          ),
          Graticule.vertical(
            longitude,
            maxLatitude: mnl!,
            minLatitude: -90.0,
          ),
        ]);
      }
    }

    return result;
  }

  LatLng get start => coordinates[0];
  LatLng get end => coordinates[1];

  bool get isHorizontal => start.latitude == end.latitude;
  bool get isVertical => start.longitude == end.longitude;

  LatLng pointAt(double t) => start.scaleTo(end, t);

  @override
  String toString() => 'Graticule(start: $start, end: $end)';
}

class GraticuleTheme {
  final Stroke style;
  final Stroke? verticalStyle;
  final Stroke? horizontalStyle;
  const GraticuleTheme({
    this.style = const Stroke(),
    this.verticalStyle,
    this.horizontalStyle,
  });

  List<Graticule> applyTo(List<Graticule> graticules) {
    return graticules.map((graticule) {
      final style =
          (graticule.isVertical ? verticalStyle : horizontalStyle) ?? this.style;

      return Graticule._(
        graticule.coordinates,
        color: graticule.color ?? style.color,
        strokeWidth: graticule.strokeWidth ?? style.width,
      );
    }).toList();
  }

  GraticuleTheme scaleTo(GraticuleTheme b, double t) {
    return GraticuleTheme(
      style: style.scaleTo(b.style, t),
      horizontalStyle: horizontalStyle?.scaleTo(b.horizontalStyle!, t),
      verticalStyle: verticalStyle?.scaleTo(b.verticalStyle!, t),
    );
  }

  @override
  String toString() =>
      'GraticuleTheme(style: $style, verticalStyle: $verticalStyle, horizontalStyle: $horizontalStyle)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GraticuleTheme &&
        o.style == style &&
        o.verticalStyle == verticalStyle &&
        o.horizontalStyle == horizontalStyle;
  }

  @override
  int get hashCode => style.hashCode ^ verticalStyle.hashCode ^ horizontalStyle.hashCode;
}
