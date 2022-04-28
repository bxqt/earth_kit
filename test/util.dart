import 'dart:math' as math;

extension DoubleExtensions on double {
  double roundToPrecision(double precision) {
    final mod = math.pow(10.0, precision);
    return (this * mod).round().toDouble() / mod;
  }
}
