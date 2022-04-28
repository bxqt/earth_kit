part of 'projection.dart';

class Mercator extends Projection {
   Mercator._();

  @override
  double get aspectRatio => 16 / 9;

  @override
  Offset project(LatLng latLng) {
    final width = size!.width;
    final height = size!.height;

    final x = (latLng.longitude + 180) * (width / 360);

    final latRad = latLng.latitude * pi / 180;
    final mercN = log(tan(pi / 4) + (latRad / 2)) / log(ln10);
    final y = (height / 2) - ((width * mercN) / (2 * pi));

    return Offset(x, y);
  }

  @override
  LatLng invert(Offset point) {
    // TODO: implement reverse
    throw UnimplementedError();
  }
}
