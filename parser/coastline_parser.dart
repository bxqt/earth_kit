/* // ignore_for_file: omit_local_variable_types, use_string_buffers

import 'model/model.dart';
import 'util/util.dart';

void createContinentsFile() {
  final shapes50m = _readCoastline(decodeFile('coastline_50m'));
  final shapes110m = _readCoastline(decodeFile('coastline_110m'), is110m: true);

  final file = '''part of 'data.dart';

abstract class Continents {
  static const Landmass world = Landmass(
    null,
    ${shapes110m.toParam},
  );
}''';

  writeFile('continents', file);
}

List<Shape> _readCoastline(dynamic shapes, {bool is110m = false}) {
  List<Shape> result = [];

  final features = shapes['features'];

  for (final feature in features) {
    final geometry = feature['geometry'];
    final shape = geometry['coordinates'];
    result.add(readShape(shape));
  }

  result.sort((a, b) => a.coordinates.length.compareTo(b.coordinates.length));
  result = result.reversed.toList();

  if (is110m) {
    final africaAsia = result[0].coordinates;
    final europe = result[2].coordinates;
    final southAmericaRight = result[5].coordinates;
    final southAmericaLeft = result[7].coordinates;

    final eurasia = Shape(europe + africaAsia);
    final southAmerica = Shape(southAmericaLeft + southAmericaRight.reversed.toList());

    return result
      ..removeAt(7)
      ..removeAt(5)
      ..removeAt(2)
      ..removeAt(0)
      ..insert(0, eurasia)
      ..insert(3, southAmerica);
  } else {
    return result..removeAt(0);
  }
}

Shape orderSequentially(List<LatLng> coordinates) {
  final List<LatLng> result = [];
  final List<LatLng> available = List.from(coordinates);

  while (result.length < coordinates.length) {
    double distance;
    LatLng closest;
    for (final latLng in available) {
      closest ??= latLng;
      distance ??= latLng.distanceTo(closest);

      final d = latLng.distanceTo(closest);
      if (d < distance) {
        distance = d;
        closest = latLng;
      }
    }

    result.add(closest);
    available.remove(closest);
  }

  return Shape(result);
}
 */