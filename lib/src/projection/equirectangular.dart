part of 'projection.dart';

class Equirectangular extends Projection {
  Equirectangular._();

  @override
  Offset project(LatLng latLng) {
    double longitude(double lon) => size!.width * (lon + 180.0) / 360.0;
    double latitude(double lat) => size!.height - (size!.height * (lat + 90.0) / 180.0);

    final x = longitude(latLng.longitude);
    final xd = longitude(origin.longitude);
    final y = latitude(latLng.latitude);
    final yd = latitude(origin.latitude);

    return Offset(x - (xd - size!.width / 2), y - (yd - size!.height / 2));
  }

  @override
  LatLng invert(Offset point) {
    final latitude = (point.dy / size!.height * 180.0) - 90.0;
    final longitude = (point.dx / size!.width * 360.0) - 180.0;

    return LatLng.clamp(latitude, longitude);

    /* final standardParallels = origin.latitudeRad;
    final centralMeridian = origin.longitudeRad;

    final r = size.shortestSide / 2;

    final latitude = (point.dy / r) + centralMeridian;
    final longitude = (point.dx / r * cos(standardParallels)) + centralMeridian;

    return LatLng(latitude, longitude); */
  }

  @override
  double get aspectRatio => 2 / 1;
}
