part of 'projection.dart';

final DynamicLibrary lib = Platform.isAndroid
    ? DynamicLibrary.open("libearth_kit.so")
    : DynamicLibrary.process();

typedef native_project = Pointer<Float> Function(
    Float size, Float latitude0, Float longitude0, Float latitude, Float longitude);

typedef Project = Pointer<Float> Function(
    double size, double latitude0, double longitude0, double latitude, double longitude);

final ffiProject =
    lib.lookup<NativeFunction<native_project>>('project').asFunction<Project>();

class Orthographic extends Projection {
  Orthographic._();

  @override
  double get aspectRatio => 1 / 1;

  @override
  Offset project(LatLng latLng) {
    final R = size!.width / 2;

    final lat = latLng.latitudeRad;
    final lon = latLng.longitudeRad;

    final x = R * cos(lat) * sin(lon - lon0);
    final y = R * (cos(lat0) * sin(lat) - sin(lat0) * cos(lat) * cos(lon - lon0));

    return Offset(R + x, size!.height - (R + y));
  }

  @override
  LatLng? invert(Offset point) {
    if (!isInsideBounds(point)) {
      return null;
    }

    final R = size!.width / 2.0;

    final x = point.dx - R;
    final y = (point.dy - size!.height) + R;

    if (x == 0.0 && y == 0.0) {
      return origin;
    }

    final lat0 = this.lat0 * -1;

    final p = sqrt(x * x + y * y);
    final c = asin(p / R);
    if (c.isNaN) return null;
    assert(!c.isNaN);

    final cosc = cos(c);
    final sinc = sin(c);
    final sinLat0 = sin(lat0);
    final cosLat0 = cos(lat0);

    var latitude = asin((cosc * sinLat0) + ((y * sinc * cosLat0) / p));
    var longitude = lon0 + atan2(x * sinc, (p * cosLat0 * cosc) - (y * sinLat0 * sinc));

    final d = 180.0 / pi;
    latitude = (latitude * d) * -1;
    longitude = longitude * d;

    if (longitude > 180.0) {
      longitude = (-180.0) + (longitude - 180.0);
    } else if (longitude < -180.0) {
      longitude = 180.0 - (longitude + 180.0).abs();
    }

    return LatLng(latitude, longitude);
  }

  @override
  bool shouldClip(LatLng latLng) {
    final lat = latLng.latitudeRad;
    final lon = latLng.longitudeRad;

    final c = sin(lat0) * sin(lat) + cos(lat0) * cos(lat) * cos(lon - lon0);
    return c < 0.0;
  }

  @override
  void joinClippedPoints(Path path, Offset start, Offset end) =>
      path.clipToBigCircle(start, end, size!.width / 2.0);

  @override
  Path get clipPath => Path()..addOval(Rect.fromLTWH(0, 0, size!.width, size!.height));

  @override
  bool isInsideBounds(Offset offset) {
    final center = size!.center(Offset.zero);

    return inCircle(
      offset,
      center,
      size!.shortestSide / 2.0,
    );
  }

  @override
  bool get isGlobe => true;
}
