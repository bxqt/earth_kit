import 'package:collection/collection.dart';

import 'lat_lng/lat_lng.dart';

class Shape extends DelegatingList<LatLng> {
  const Shape(List<LatLng> coordinates) : super(coordinates);

  bool isIn(LatLng latLng) {
    bool isInside = false;

    for (var i = 0, j = length - 1; i < length; j = i++) {
      if ((this[i].latitude > latLng.latitude) != (this[j].latitude > latLng.latitude) &&
          latLng.longitude <
              (this[j].longitude - this[i].longitude) *
                      (latLng.latitude - this[i].latitude) /
                      (this[j].latitude - this[i].latitude) +
                  this[i].longitude) {
        isInside = !isInside;
      }
    }

    return isInside;
  }

  @override
  String toString() => 'Shape($length)';
}
