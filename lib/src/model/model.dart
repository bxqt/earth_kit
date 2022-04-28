import 'dart:ui';

import 'package:flutter/material.dart';

export 'bbox.dart';
export 'continent.dart';
export 'country.dart';
export 'data/data.dart';
export 'economy.dart';
export 'graticule.dart';
export 'heatmap.dart';
export 'lake.dart';
export 'lat_lng/lat_lng.dart';
export 'polygon.dart';
export 'river.dart';
export 'shape.dart';
export 'topography.dart';
export 'vector_field.dart';

class Stroke {
  final Color? color;
  final double width;
  const Stroke({
    this.color = Colors.white,
    this.width = 1.0,
  }) : assert(width >= 0.0);

  static const Stroke none = Stroke(width: 0.0);

  Stroke scaleTo(Stroke b, double t) {
    return Stroke(
      color: Color.lerp(color, b.color, t),
      width: lerpDouble(width, b.width, t)!,
    );
  }

  bool get shouldPaint => color!.opacity > 0.0 && width > 0.0;

  @override
  String toString() => 'Stroke(color: $color, width: $width)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Stroke && o.color == color && o.width == width;
  }

  @override
  int get hashCode => color.hashCode ^ width.hashCode;
}
