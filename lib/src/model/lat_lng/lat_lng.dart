import 'dart:math' as math;
import 'dart:ui';

import '../../util/util.dart';
import 'distance/distance.dart';

export 'distance/distance.dart';

/// Modified from https://github.com/MikeMitterer/dart-latlong

/// A pair of latitude and longitude coordinates in degrees.
class LatLng {
  final double latitude;
  final double longitude;
  const LatLng(
    this.latitude,
    this.longitude,
  )   : assert(
          latitude >= -90.0 && latitude <= 90.0,
          'Latitude must be between -90 and 90 degrees but was $latitude',
        ),
        assert(
          longitude >= -180.0 && longitude <= 180.0,
          'Longitude must be between -180 and 180 degrees but was $longitude',
        );

  /// The coordinate where equator and meridian intersect (0.0, 0.0);
  static const LatLng primeMeridian = LatLng(0.0, 0.0);
  static const LatLng northPole = LatLng(90.0, 0.0);
  static const LatLng southPole = LatLng(-90.0, 0.0);

  static const LatLng bottomLeft = LatLng(-90.0, -180.0);
  static const LatLng bottomRight = LatLng(-90.0, 180.0);
  static const LatLng topLeft = LatLng(90.0, -180.0);
  static const LatLng topRight = LatLng(90.0, 180.0);

  /// Creates a pair of [latitude] and [longitude] coordinates in degrees
  /// clamped to the bounds of the world.
  factory LatLng.clamp(double latitude, double longitude) {
    return LatLng(
      latitude.clamp(-90.0, 90.0),
      longitude.clamp(-180.0, 180.0),
    );
  }

  static LatLng? tryParse(String src) {
    final coordinates = src.split(',').map((e) => double.tryParse(e.trim())).toList();
    if (coordinates.length != 2) return null;

    double? latitude = coordinates[0];
    double? longitude = coordinates[1];

    bool areCoordsValid() =>
        (latitude! >= -90.0 && latitude <= 90.0) &&
        (longitude! >= -180.0 && longitude <= 180.0);

    if (!areCoordsValid()) {
      latitude = coordinates[1];
      longitude = coordinates[0];

      if (!areCoordsValid()) {
        return null;
      }
    }

    return LatLng(latitude!, longitude!);
  }

  LatLng scaleTo(LatLng b, double t) {
    return LatLng(
      lerpDouble(latitude, b.latitude, t)!,
      lerpDouble(longitude, b.longitude, t)!,
    );
  }

  LatLng toRadians() => LatLng(latitudeRad, longitudeRad);

  double get latitudeRad => latitude.radians;
  double get longitudeRad => longitude.radians;
  double get latF => (latitude + 90.0) / 180.0;
  double get lonF => (longitude + 180.0) / 360.0;

  double bearingTo(LatLng latLng) {
    final diffLongitude = latLng.longitudeRad - longitudeRad;

    final y = math.sin(diffLongitude);
    final x = math.cos(latitudeRad) * math.tan(latLng.latitudeRad) -
        math.sin(latitudeRad) * math.cos(diffLongitude);

    return math.atan2(y, x).degrees % 360.0;
  }

  double distanceTo(
    LatLng latLng, {
    LengthUnit unit = LengthUnit.Meter,
    DistanceAlgorithm algorithm = DistanceAlgorithm.vincenty,
  }) {
    final Distance distance = algorithm == DistanceAlgorithm.vincenty
        ? const DistanceVincenty()
        : const DistanceHaversine();
    return distance.as(unit, this, latLng);
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() =>
      'LatLng(latitude: ${latitude.toStringAsFixed(3)}, longitude: ${longitude.toStringAsFixed(3)})';

  /// Converts lat/long values into sexagesimal
  ///
  /// LatLng(51.519475, -19.37555556);
  /// Shows: 51° 31' 10.11" N, 19° 22' 32.00" W
  String toSexagesimal() {
    final latDirection = latitude >= 0 ? "N" : "S";
    final lonDirection = longitude >= 0 ? "O" : "W";
    return "${decimal2sexagesimal(latitude)} $latDirection, ${decimal2sexagesimal(longitude)} $lonDirection";
  }

  LatLng round({int decimals = 6}) => LatLng(
        _round(latitude, decimals: decimals),
        _round(longitude, decimals: decimals),
      );

  double _round(double value, {int decimals = 6}) {
    return (value * math.pow(10, decimals)).round() / math.pow(10, decimals);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LatLng && o.latitude == latitude && o.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

String decimal2sexagesimal(final double dec) {
  List<int> _split(final double value) {
    final List<String> parts = value.toStringAsFixed(6).split('.');

    if (parts.length < 2) {
      return [0, 0];
    }

    return <int>[
      int.parse(parts[0]).abs(),
      int.parse(parts[1]),
    ];
  }

  final List<int> parts = _split(dec);
  final int integerPart = parts[0];
  final int fractionalPart = parts[1];

  final int deg = integerPart;
  final double min = double.parse('0.$fractionalPart') * 60;

  final List<int> minParts = _split(min);
  final int minFractionalPart = minParts[1];

  final double sec = double.parse('0.$minFractionalPart') * 60;

  return "$deg° ${min.floor()}' ${sec.toStringAsFixed(2)}\"";
}
