import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'model/model.dart';

// ignore_for_file: prefer_const_constructors

class Arcs extends DelegatingList<Shape> {
  Arcs([List<Shape>? arcs]) : super(arcs ?? []);
}

class ArcRef<T extends num> extends DelegatingList<List<List<T>>> {
  ArcRef(List<List<List<T>>> refs) : super(refs);
}

class _Args {
  final List<Topography> topologies;
  final List<List<String?>> files;
  _Args(this.topologies, this.files);
}

Future<List<Topo>> parseTopology(List<Topography> topologies) async {
  final List<List<String?>> files = [];

  // ignore: missing_return
  Future<String?> loadFile(String? path) async {
    if (path == null) return null;

    try {
      return await rootBundle.loadString(path);
    } on Error {
      try {
        return await File(path).readAsString();
      } catch (_) {}
    }
  }

  for (final topology in topologies) {
    final countries = await loadFile(topology.countries);
    assert(countries != null, 'Couldn\'t load ${topology.countries}');

    final coastline = await loadFile(topology.coastline);
    assert(coastline != null, 'Couldn\'t load ${topology.coastline}');

    final rivers = await loadFile(topology.rivers);
    final lakes = await loadFile(topology.lakes);

    if (coastline != null && countries != null) {
      files.add([countries, coastline, rivers, lakes]);
    }
  }

  return compute(_parseTopology, _Args(topologies, files));
}

Future<List<Topo>> _parseTopology(_Args args) async {
  final List<Topo> result = [];

  for (var i = 0; i < args.topologies.length; i++) {
    final topology = args.topologies[i];
    final files = args.files[i];

    final countryTopo = jsonDecode(files[0]!);
    final coastlineTopo = jsonDecode(files[1]!);
    final riversTopo = files[2] != null ? jsonDecode(files[2]!) : null;
    final lakesTopo = files[3] != null ? jsonDecode(files[3]!) : null;

    result.add(Topo(
      coastline: _parseCoastline(coastlineTopo),
      countries: _parseCountries(countryTopo),
      rivers: _parseRivers(riversTopo),
      lakes: _parseLakes(lakesTopo),
      zoom: topology.zoom,
    ));
  }

  return result;
}

List<Shape> _parseCoastline(coastlineTopo) => _shapesFromJson(coastlineTopo);

Map<Country, List<Shape>> _parseCountries(countryTopo) {
  final arcs = _parseJson(countryTopo);
  final Map<Country, List<Shape>> result = {};

  _iter(countryTopo, (geometry, properties) {
    final country = Countries.isoA2[properties['ISO_A2'] ?? ''] ??
        Countries.isoA3[properties['ISO_A3'] ?? ''] ??
        Countries.all.firstWhereOrNull(
          (country) {
            final name = properties['ADMIN'] ?? properties['NAME'];
            return country.name == name;
          },
        );

    if (country != null) {
      final ref = _parseArcRef(geometry);
      result[country] = _shapesOfRef(arcs, ref);
    }
  });

  assert(result.isNotEmpty, 'Topo json couldn\'t be parsed!');
  return result;
}

Map<River, List<Shape>> _parseRivers(riversTopo) {
  if (riversTopo == null || riversTopo.isEmpty) return const {};

  final arcs = _parseJson(riversTopo);
  final Map<River, List<Shape>> result = {};

  _iter(riversTopo, (geometry, properties) {
    final name = properties['name'] ?? properties['name_en'];
    final river = Rivers.all.firstWhere(
      (river) => river.name == name || river.englishName == name,
      orElse: () => River(name: name),
    );

    final shapes = _shapesOfGeometry(arcs, geometry);
    if (shapes == null) return;

    // TopoJson files sometimes have rivers split
    // into multiple objects (???). Make sure we
    // add the arcs to the River if it already
    // exists in the mapping.
    if (result.containsKey(river)) {
      result[river]?.addAll(shapes);
    } else {
      result[river] = shapes;
    }
  });

  return result;
}

Map<Lake, List<Shape>> _parseLakes(lakesTopo) {
  if (lakesTopo == null || lakesTopo.isEmpty) return const {};

  final arcs = _parseJson(lakesTopo);
  final Map<Lake, List<Shape>> result = {};

  _iter(lakesTopo, (geometry, properties) {
    final name = properties['name'] ?? properties['name_alt'];
    final lake = Lakes.all.firstWhere(
      (lake) => lake.name == name || lake.nameAlt == name,
      orElse: () => Lake(name: name),
    );

    final shapes = _shapesOfGeometry(arcs, geometry);
    if (shapes == null) return;

    if (result.containsKey(lake)) {
      result[lake]?.addAll(shapes);
    } else {
      result[lake] = shapes;
    }
  });

  return result;
}

Arcs _parseJson(Map<String, dynamic> json) {
  if (json.isTopoJson) {
    assert(json.containsKey('arcs'));
    assert(json.containsKey('transform'));
    assert(json.containsKey('objects'));

    final rawArcs = json['arcs'];
    final scale = json['transform']['scale'];
    final translate = json['transform']['translate'];

    return _parseArcsFromTopoJson(rawArcs, scale, translate);
  } else {
    return Arcs();
  }
}

Arcs _parseArcsFromTopoJson(
  List arcs,
  List? scale,
  List? translate,
) {
  final Arcs coordinates = Arcs();

  for (final arc in arcs) {
    final result = Shape([]);

    var x = 0.0, y = 0.0;
    for (final coord in arc) {
      assert(coord.length == 2);

      final lon = (x += coord[0]) * scale![0].toDouble() + translate![0].toDouble();
      final lat = (y += coord[1]) * scale[1].toDouble() + translate[1].toDouble();

      result.add(LatLng.clamp(lat, lon));
    }

    coordinates.add(result);
  }

  return coordinates;
}

List<Shape>? _shapesOfGeometry(Arcs arcs, geometry) {
  final ref = _parseArcRef(geometry);
  if (ref.isEmpty) return null;
  return _shapesOfRef(arcs, ref);
}

ArcRef<T> _parseArcRef<T extends num>(geometry) {
  final type = geometry['type'];
  final isGeoJson = geometry['coordinates'] != null;

  var arcs = (geometry['arcs'] ?? geometry['coordinates']) as List?;
  if (type == 'Polygon' || type == 'MultiLineString') {
    arcs = [arcs];
  } else if (type == 'LineString') {
    arcs = [
      [arcs]
    ];
  }

  if (isGeoJson) {
    arcs = arcs!.expand((element) => element).toList();
  }

  // Well...
  final result = List<List<List<T>>>.from(
    List<List<List<T>>>.from(
      arcs!.map(
        (a) => List<List<T>>.from(
          a.map((b) => List<T>.from(b)),
        ),
      ),
    ),
  );

  return ArcRef<T>(result);
}

List<ArcRef> _parseArcRefs(Map<String, dynamic> json) {
  final List<ArcRef> result = [];

  _iter(
    json,
    (geometry, properties) {
      result.add(_parseArcRef(geometry));
    },
  );

  return result;
}

List<Shape> _shapesFromJson(json) {
  final arcs = _parseJson(json);
  final refs = _parseArcRefs(json);
  return refs.map((ref) => _shapesOfRef(arcs, ref)).expand((element) => element).toList();
}

List<Shape> _shapesOfRef(Arcs arcs, ArcRef ref) {
  final List<Shape> result = [];
  final isGeoJson = ref.first.first.first is double;

  if (isGeoJson) {
    for (final group in ref) {
      final shape = Shape([]);

      for (final coordinate in group) {
        final latitude = coordinate[1].toDouble();
        final longitude = coordinate[0].toDouble();
        shape.add(LatLng.clamp(latitude, longitude));
      }

      result.add(shape);
    }
  } else {
    for (final group in ref) {
      for (final subgroup in group) {
        final shape = Shape([]);

        for (final index in subgroup) {
          final isReverse = index.isNegative;
          Shape arc = arcs[isReverse ? index.abs() - 1 as int : index as int];

          if (isReverse) {
            arc = Shape(arc.reversed.toList());
          }

          shape.addAll(arc);
        }

        if (shape.isNotEmpty) {
          result.add(shape);
        }
      }
    }
  }

  return result;
}

void _iter(
  Map<String, dynamic> json,
  void Function(Map<String, dynamic> geometry, Map<String, dynamic> properties) iterator,
) {
  if (json.isTopoJson) {
    final objects = json['objects'] as Map<String, dynamic>;

    for (final key in objects.keys) {
      final object = objects[key];
      final type = object['type'];

      if (type == 'GeometryCollection') {
        for (final Map<String, dynamic> geometry in object['geometries']) {
          final properties = geometry['properties'];
          if (!geometry.containsKey('arcs')) continue;
          iterator(geometry, properties);
        }
      }
    }
  } else if (json.isGeoJson) {
    final features = json['features'];
    for (final feature in features) {
      final properties = feature['properties'];
      final geometry = feature['geometry'];
      if (!geometry.containsKey('coordinates')) continue;
      iterator(geometry, properties);
    }
  } else {
    throw ArgumentError.value('Only TopoJsons and GeoJsons are supported file formats!');
  }
}

extension _JsonExtensions on Map<String, dynamic> {
  bool get isTopoJson => this['type'] == 'Topology';
  bool get isGeoJson => this['type'] == 'FeatureCollection';
}
