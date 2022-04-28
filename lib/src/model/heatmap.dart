import 'dart:typed_data';
import 'dart:ui';

import 'package:collection/collection.dart';

import 'vector_field.dart';

typedef HeatmapColorBuilder = Color Function(double value);

class Heatmap extends VectorField {
  final double pixelSize;
  final double zIndex;
  final ColorScale scale;
  final List<Float32List> data;
  final bool interpolate;
  const Heatmap({
    required this.data,
    this.pixelSize = 1.0,
    this.zIndex = 3.0,
    required this.scale,
    this.interpolate = true,
  })  : assert(pixelSize >= 1.0),
        super(data);

  factory Heatmap.debugGradient(
    Color color, {
    double pixelSize = 1.0,
    double zIndex = 2.0,
    int width = 360,
    int height = 180,
  }) {
    assert(width / height == 2.0);

    final columns = List.generate(height, (y) {
      final row = Float32List(width);
      for (var i = 0; i < width; i++) {
        row[i] = i.toDouble() / width.toDouble();
      }
      return row;
    });

    return Heatmap(
      data: columns,
      scale: ColorScale([
        ColorStop(0.0, color.withAlpha(0)),
        ColorStop(1.0, color),
      ]),
      pixelSize: pixelSize,
      zIndex: zIndex,
      interpolate: true,
    );
  }

  /// A slightly more efficient method to lerp between
  /// two Colors.
  static Color lerpColor(Color a, Color b, double t) {
    int lerpInt(int a, int b, double t) => (a + (b - a) * t).toInt();

    return Color.fromARGB(
      a.alpha == b.alpha ? b.alpha : lerpInt(a.alpha, b.alpha, t),
      a.red == b.red ? b.red : lerpInt(a.red, b.red, t),
      a.green == b.green ? b.green : lerpInt(a.green, b.green, t),
      a.blue == b.blue ? b.blue : lerpInt(a.blue, b.blue, t),
    );
  }

  double get latRes => yRes;
  double get lonRes => xRes;

  Color eval(double value) => scale.eval(value);

  /// Scales the values of this `Heatmap` towards
  /// the value of `b` with the given scalar `t`.
  ///
  /// This method is potentially computationally expensive
  /// and should be avoided to be executed on the main
  /// isolate or on the CPU in general.
  Heatmap scaleTo(Heatmap b, double t) {
    assert(b is Heatmap);

    return Heatmap(
      data: VectorField(data).scaleTo(VectorField(b.data), t),
      scale: t < 0.5 ? scale : b.scale,
      zIndex: lerpDouble(zIndex, b.zIndex, t)!,
      pixelSize: lerpDouble(pixelSize, b.pixelSize, t)!,
      interpolate: t < 0.5 ? interpolate : b.interpolate,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Heatmap &&
        o.scale == scale &&
        o.zIndex == zIndex &&
        o.interpolate == interpolate &&
        o.data == data;
  }

  @override
  int get hashCode =>
      scale.hashCode ^ interpolate.hashCode ^ zIndex.hashCode ^ super.hashCode;
}

/// A Gradient with absolute color stops.
class ColorScale extends DelegatingList<ColorStop> {
  const ColorScale(
    List<ColorStop> stops,
  ) : super(stops);

  factory ColorScale.zero(List<Color> colors) {
    return ColorScale(colors.map((c) => ColorStop(0.0, c)) as List<ColorStop>).toList() as ColorScale;
  }

  List<Color> get colors => map((s) => s.color).toList();

  Color eval(double value) {
    ColorStop? start;
    ColorStop? end;

    for (final stop in this) {
      if (stop.value <= value && (start == null || stop.value > start.value)) {
        start = stop;
      }

      if (stop.value >= value && (end == null || stop.value < end.value)) {
        end = stop;
      }
    }

    start ??= first;
    end ??= last;

    return start.scaleTo(end, value);
  }

  List<dynamic> toMap() => map((stop) => stop.toMap()).toList();
}

class ColorStop {
  final double value;
  final Color color;
  const ColorStop(this.value, this.color);

  Color scaleTo(ColorStop b, double value) {
    if (this == b) return color;

    final t = (value - this.value) / (b.value - this.value);
    return Heatmap.lerpColor(color, b.color, t);
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'color': [
        color.red / 255.0,
        color.green / 255.0,
        color.blue / 255.0,
        color.alpha / 255.0,
      ],
    };
  }
}
