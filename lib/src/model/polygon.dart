import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'lat_lng/lat_lng.dart';
import 'shape.dart';

class Polyline {
  final List<LatLng> coordinates;
  final Color? color;
  final double? strokeWidth;
  const Polyline({
    required this.coordinates,
    required this.color,
    this.strokeWidth,
  });

  bool get hasStroke => strokeWidth! > 0.0 && color!.opacity > 0;

  @override
  String toString() =>
      'Polyline(coordinates: $coordinates, color: $color, strokeWidth: $strokeWidth)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Polyline &&
        o.coordinates == coordinates &&
        o.color == color &&
        o.strokeWidth == strokeWidth;
  }

  @override
  int get hashCode => coordinates.hashCode ^ color.hashCode ^ strokeWidth.hashCode;
}

class Polygon extends Shape {
  final String id;
  final List<LatLng> coordinates;
  final Color? color;
  final Color? strokeColor;
  final double? strokeWidth;
  const Polygon({
    required this.id,
    required this.coordinates,
    this.color,
    this.strokeColor,
    this.strokeWidth,
  })  : assert(strokeWidth == null || strokeWidth >= 0.0),
        super(coordinates);

  bool get hasFill => color!.opacity > 0;
  bool get hasStroke => strokeColor!.opacity > 0 && strokeWidth! > 0.0;

  Polygon copyWith({
    String? id,
    List<LatLng>? coordinates,
    Color? color,
    Color? strokeColor,
    double? strokeWidth,
  }) {
    return Polygon(
      id: id ?? this.id,
      coordinates: coordinates ?? this.coordinates,
      color: color ?? this.color,
      strokeColor: strokeColor ?? this.strokeColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }

  @override
  String toString() {
    return 'Polygon(id: $id, coordinates: $coordinates, color: $color, strokeColor: $strokeColor, strokeWidth: $strokeWidth)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Polygon &&
        o.id == id &&
        o.coordinates == coordinates &&
        o.color == color &&
        o.strokeColor == strokeColor &&
        o.strokeWidth == strokeWidth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        coordinates.hashCode ^
        color.hashCode ^
        strokeColor.hashCode ^
        strokeWidth.hashCode;
  }
}

class MultiPolygon extends DelegatingList<Polygon> {
  final String id;
  final Color? color;
  final Color? strokeColor;
  final double? strokeWidth;
  MultiPolygon({
    required this.id,
    required List<Shape> shapes,
    this.color,
    this.strokeColor,
    this.strokeWidth,
  }) : super(
          shapes
              .map(
                (shape) => Polygon(
                  id: '${id}_${shapes.indexOf(shape)}',
                  coordinates: shape,
                  color: color,
                  strokeColor: strokeColor,
                  strokeWidth: strokeWidth,
                ),
              )
              .toList(),
        );
}

class PolygonTheme {
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  const PolygonTheme({
    this.color = Colors.red,
    this.strokeColor = Colors.grey,
    this.strokeWidth = 1.0,
  }) : assert(strokeWidth >= 0.0);

  List<Polygon> applyToPolygons(List<Polygon> polygons) {
    return polygons
        .map((poly) => Polygon(
              id: poly.id,
              coordinates: poly,
              color: poly.color ?? color,
              strokeWidth: poly.strokeWidth ?? strokeWidth,
              strokeColor: poly.strokeColor ?? strokeColor,
            ))
        .toList();
  }

  List<Polyline> applyToPolylines(List<Polyline> polylines) {
    return polylines
        .map((line) => Polyline(
              coordinates: line.coordinates,
              color: line.color ?? strokeColor,
              strokeWidth: line.strokeWidth ?? strokeWidth,
            ))
        .toList();
  }

  PolygonTheme scaleTo(PolygonTheme b, double t) {
    return PolygonTheme(
      color: Color.lerp(color, b.color, t)!,
      strokeColor: Color.lerp(strokeColor, b.strokeColor, t)!,
      strokeWidth: lerpDouble(strokeWidth, b.strokeWidth, t)!,
    );
  }

  @override
  String toString() =>
      'PolygonTheme(color: $color, strokeColor: $strokeColor, strokeWidth: $strokeWidth)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PolygonTheme &&
        o.color == color &&
        o.strokeColor == strokeColor &&
        o.strokeWidth == strokeWidth;
  }

  @override
  int get hashCode => color.hashCode ^ strokeColor.hashCode ^ strokeWidth.hashCode;
}
