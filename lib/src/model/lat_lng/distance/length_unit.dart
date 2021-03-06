part of 'distance.dart';

class LengthUnit {
  static const LengthUnit Millimeter = LengthUnit(1000.0);
  static const LengthUnit Centimeter = LengthUnit(100.0);
  static const LengthUnit Meter = LengthUnit(1.0);
  static const LengthUnit Kilometer = LengthUnit(0.001);
  static const LengthUnit Mile = LengthUnit(0.0006213712);

  final double scaleFactor;

  const LengthUnit(this.scaleFactor);

  double to(final LengthUnit unit, final num value) {
    if (unit.scaleFactor == scaleFactor) {
      return value as double;
    }

    // Convert to primary unit.
    final double primaryValue = value / scaleFactor;

    // Convert to destination unit.
    return primaryValue * unit.scaleFactor;
  }
}
