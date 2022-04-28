import 'dart:typed_data';
import 'dart:ui';

import 'package:collection/collection.dart';

import 'model.dart';

class VectorField extends DelegatingList<Float32List> {
  const VectorField(List<Float32List> data) : super(data);

  factory VectorField.rowMajor(Float32List data, int width) {
    assert(data.length % width == 0.0);

    final height = (data.length / width).floor();

    final List<Float32List> result = List.filled(height, Float32List(0));

    for (var y = 0; y < height; y++) {
      final row = Float32List(width);

      for (var x = 0; x < width; x++) {
        final i = y * width + x;
        row[x] = data[i];
      }

      result[y] = row;
    }

    return VectorField(result);
  }

  double get yRes => (length - 1) / 180.0;
  double get xRes => (first.length - 1) / 360.0;

  double y(double latitude) => (latitude - 90.0).abs() * yRes;
  double x(double longitude) => (longitude + 180.0) * xRes;
}

extension DoubleVectorFieldExtensions on VectorField {
  double? interpolate(LatLng latLng) {
    final x = this.x(latLng.longitude);
    final y = this.y(latLng.latitude);

    final y1 = y.floor();
    final y2 = y.ceil();

    final x1 = x.floor();
    final x2 = x.ceil();

    if (y1 == y2) {
      return lerpDouble(this[y1][x1], this[y1][x2], x);
    }

    if (x1 == x2) {
      return lerpDouble(this[y1][x1], this[y2][x2], y);
    }

    return billinearInterpolation(
      Vertex(x1, y1, this[y1][x1]),
      Vertex(x2, y1, this[y1][x2]),
      Vertex(x1, y2, this[y2][x1]),
      Vertex(x2, y2, this[y2][x2]),
      x,
      y,
    );
  }

  double? call(LatLng latLng) => interpolate(latLng);

  /// Scales all values towards `b` by the given scalar `t`.
  ///
  /// This method is potentially computationally expensive
  /// and should be avoided to be executed on the main
  /// isolate or on the CPU in general.
  VectorField scaleTo(VectorField b, double t) {
    assert(
      length == b.length,
      'When scaling between VectorFields, both VectorFields must have the same height.',
    );

    final List<Float32List> data = [];

    for (var y = 0; y < b.length; y++) {
      final scaledRow = Float32List(b.length);

      final Float32List aRow = this[y];
      final Float32List bRow = b[y];

      assert(
        aRow.length == bRow.length,
        'When scaling between VectorFields, each row must have the same length.',
      );

      for (var x = 0; x < bRow.length; x++) {
        final value = bRow[x];
        final oldValue = aRow.length > x ? aRow[x] : value;
        scaledRow[x] = lerpDouble(value, oldValue, t)!;
      }
    }

    return VectorField(data);
  }
}

class Vertex {
  final num x;
  final num y;
  final double value;
  const Vertex(this.x, this.y, this.value);
}

double billinearInterpolation(
  Vertex topLeft,
  Vertex topRight,
  Vertex bottomLeft,
  Vertex bottomRight,
  double x,
  double y,
) {
  assert(
    x >= topLeft.x && x <= bottomRight.x,
    '$x not in [${topLeft.x}..${bottomRight.x}]',
  );
  assert(
    y >= topLeft.y && y <= bottomRight.y,
    '$y not in [${topLeft.y}..${bottomRight.y}]',
  );

  // Suppose that we want to find the value of the unkwnon function
  // f at the point (x, y). It is assumed that we know the value of
  // f at the four points:
  //
  // Q11 = (x1, y1)
  // Q21 = (x2, y1)
  // Q12 = (x1, y2)
  // Q22 = (x2, y2)
  //
  //  We first do linear interpolation in the x-direction:

  // x2 - x1
  final xDelta = topRight.x - topLeft.x;
  // x2 - x  / x2 - x1
  final x2Inter = (topRight.x - x) / xDelta;
  // x - x1 / x2 - x1
  final x1Inter = (x - topLeft.x) / xDelta;

  // f(x, y1) = (x2 - x  / x2 - x1) * Q11 + (x - x1 / x2 - x1) * Q21
  final r1 = (x2Inter * topLeft.value) + (x1Inter * topRight.value);
  // f(x, y2) = (x2 - x  / x2 - x1) * Q12 + (x - x1 / x2 - x1) * Q22
  final r2 = (x2Inter * bottomLeft.value) + (x1Inter * bottomRight.value);

  // Then we proceed by interpolating in the y-direction to obtain the
  // the desired estimate:

  final yDelta = bottomLeft.y - topLeft.y;

  // f(x, y) = (y1 - y / y2 - y1) * f(x, y1) + (y - y1 / y2 - y1) * f(x, y2)
  return ((bottomLeft.y - y / yDelta) * r1) + ((y - topLeft.y / yDelta) * r2);
}
