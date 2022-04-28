part of 'property_parser.dart';

String _createRiverFile(topo) {
  final Set<String> riverNames = {};

  final rivers = _createIteratively(
    topo,
    (feature, properties) {
      final name = properties['name'];
      final nameEn = properties['name_en'];
      final zoom = properties['min_zoom'] ?? 0.0;
      final shapes = _parseGeometry(feature['geometry']);
      if (shapes.isEmpty || name == null) return null;
      final bbox = _parseBBox(shapes);

      final argName = ((nameEn ?? name) as String).varName;
      if (riverNames.contains(argName)) return null;

      riverNames.add(argName);

      return '''  /// $name river
  static const River $argName = River(
    name: '$name',
    englishName: '$nameEn',
    bbox: $bbox,
    zoom: $zoom,
  );

''';
    },
  );

  final all = riverNames.join(', ');

  return '''part of 'data.dart';

/// [River] constants that can be used to apply a custom [RiverStyle]
/// to a given River or multiple Rivers.
/// 
/// All rivers were read out from the
/// (50m natural earth rivers geoJson)[https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_50m_rivers.geojson]
abstract class Rivers {
  /// Filters all rivers by the given [predicate]. Shorthand for calling `Rivers.all.where(predicate).toList()`.
  static List<River> where(bool Function(River river) predicate) => all.where(predicate).toList();

  /// Maps each River to a [Stroke].
  static Map<River, Stroke> map(Stroke Function(River river) iterator) =>
      Map.fromIterable(all, value: (value) => iterator(value as River));

  static const List<River> all = [$all];

$rivers
}
''';
}
