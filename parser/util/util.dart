import 'dart:convert';
import 'dart:io';

import '../model/model.dart';
import '../parser.dart';

export 'extensions.dart';

double toPrecision(num value, {int precision = 4}) =>
    double.parse(value.toStringAsPrecision(precision));

void writeFile(String name, String content) {
  final dir = path + name;
  File(dir).writeAsStringSync(content);
}

String readFile(String path) {
  return File(path).readAsStringSync();
}

dynamic decodeFile(String path) => json.decode(readFile(path));

Shape readShape(dynamic shape) {
  final List<LatLng> points = [];

  for (final coord in shape) {
    if (coord.length > 2) {
      points.addAll(
        readShape(coord).coordinates,
      );
    } else {
      points.add(parseCoordinate(coord));
    }
  }

  return Shape(points);
}

LatLng parseCoordinate(dynamic coord) {
  return LatLng(
    toPrecision(coord[1]),
    toPrecision(coord[0]),
  );
}
