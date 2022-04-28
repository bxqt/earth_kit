import 'dart:io';

import '../model/model.dart';
import '../parser.dart';
import '../util/util.dart';

part 'country_parser.dart';
part 'lakes_parser.dart';
part 'river_parser.dart';

void createDartFileFromProperties(String type) {
  final topo = decodeFile(path + fileName);

  if (topo['type'] != 'FeatureCollection') {
    print('File must be a GeoJso');
    exit(2);
  }

  String file;
  switch (type) {
    case 'countries':
    case 'country':
    case 'c':
      file = _createCountryFile(topo);
      break;
    case 'rivers':
    case 'r':
      file = _createRiverFile(topo);
      break;
    case 'lakes':
    case 'l':
      file = _createLakesFile(topo);
      break;
    default:
      print('Unknown property argument: $type');
      exit(2);
  }

  final name = '$fileNameWithoutSuffix.dart';
  writeFile(name, file);
  print('Wrote .dart file $name at ${path + name}.');
}

String _createIteratively(
  topo,
  String Function(Map<String, dynamic> feature, Map<String, dynamic> properties) iterator,
) {
  String result = '';

  for (final feature in topo['features']) {
    final properties = feature['properties'];
    final value = iterator(feature, properties);
    if (value != null) {
      result += value;
    }
  }

  return result;
}

BBox _parseBBox(List<Shape> shapes) {
  if (shapes == null) return null;

  Shape biggest;
  for (final shape in shapes) {
    biggest ??= shape;
    if (shape.coordinates.length > biggest.coordinates.length) {
      biggest = shape;
    }
  }

  final coords = biggest.coordinates;

  double top = coords[0].latitude, bottom = coords[0].latitude;
  double left = coords[0].longitude, right = coords[0].longitude;

  for (final latLng in biggest.coordinates) {
    final lat = latLng.latitude;
    final lon = latLng.longitude;

    if (lat > top) top = lat;
    if (lat < bottom) bottom = lat;
    if (lon < left) left = lon;
    if (lon > right) right = lon;
  }

  return BBox(LatLng(bottom, left), LatLng(top, right));
}

List<Shape> _parseGeometry(dynamic geometry) {
  if (geometry == null) return null;

  final coordinates = geometry['coordinates'];
  final isLineString = geometry['type'] == 'LineString';
  final isMultiPolygon = geometry['type'] == 'MultiPolygon';

  final List<Shape> shapes = [];

  void parseShape(dynamic geometry) {
    for (final shape in geometry) {
      shapes.add(readShape(shape));
    }
  }

  if (isLineString) {
    shapes.add(
      Shape(List<LatLng>.from(coordinates.map(parseCoordinate))),
    );
  } else if (isMultiPolygon) {
    for (final shape in coordinates) {
      parseShape(shape);
    }
  } else {
    parseShape(coordinates);
  }

  assert(shapes.isNotEmpty);
  return shapes;
}
