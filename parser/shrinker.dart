import 'dart:convert';
import 'dart:io';

import 'parser.dart';
import 'util/util.dart';

void shrinkTopoJson(String type) {
  if (!fileName.endsWith('.json')) {
    print('File ($fileName) is not a .json file!');
    exit(2);
  }

  String file;
  final topo = decodeFile(path + fileName);
  switch (type) {
    case 'countries':
    case 'country':
    case 'c':
      file = _removeCountryProperties(topo);
      break;
    case 'coastline':
    case 'continents':
      file = _removeCoastlineProperties(topo);
      break;
    default:
      print('Unknown shrink argument: $type');
      exit(2);
  }

  final name = 'shrinked_$fileName';
  writeFile(name, file);
  print('Wrote shrinked file $name at ${path + fileName}.');
}

String _removeCountryProperties(topo) {
  return _shrinkProperties(topo, shrinker: (oldProps, newProps) {
    newProps['ISO_A2'] = oldProps['ISO_A2'];
    newProps['ISO_A3'] = oldProps['ISO_A3'];
    newProps['ADMIN'] = oldProps['ADMIN'] ?? oldProps['NAME'];
  });
}

String _removeCoastlineProperties(topo) => _shrinkProperties(topo);

String _shrinkProperties(
  dynamic topo, {
  void Function(Map<String, dynamic> oldProps, Map<String, dynamic> newProps) shrinker,
}) {
  final Map<String, dynamic> result = {};

  result['type'] = 'Topology';
  result['arcs'] = topo['arcs'];
  result['transform'] = topo['transform'];

  final objects = topo['objects'] as Map<String, dynamic>;
  final Map<String, dynamic> resultObjects = {};
  for (final key in objects.keys) {
    final object = objects[key];
    final Map<String, dynamic> result = {};

    if (object['type'] == 'GeometryCollection') {
      result['type'] = 'GeometryCollection';
      final List geometries = [];

      for (final geometry in object['geometries']) {
        final Map<String, dynamic> result = {};
        result['arcs'] = geometry['arcs'];
        result['type'] = geometry['type'];

        if (shrinker != null) {
          final oldProperties = geometry['properties'];
          final Map<String, dynamic> newProperties = {};
          shrinker(oldProperties, newProperties);

          result['properties'] = newProperties;
        }

        geometries.add(result);
      }

      result['geometries'] = geometries;
      resultObjects[key] = result;
    }
  }

  result['objects'] = resultObjects;
  return jsonEncode(result);
}
