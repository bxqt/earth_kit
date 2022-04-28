part of 'property_parser.dart';

String _createLakesFile(topo) {
  final Set<String> lakeNames = {};

  final rivers = _createIteratively(
    topo,
    (feature, properties) {
      final name = properties['name'];
      final nameAlt = properties['name_alt'];
      final zoom = properties['min_zoom'] ?? 0.0;
      final shapes = _parseGeometry(feature['geometry']);
      if (shapes.isEmpty || name == null) return null;
      final bbox = _parseBBox(shapes);

      final argName = ((name ?? nameAlt) as String).varName;
      if (lakeNames.contains(argName)) return null;
      lakeNames.add(argName);

      return '''  /// $name
  static const Lake $argName = Lake(
    name: ${name.contains('\'') ? '"$name"' : "'$name'"},
    nameAlt: ${nameAlt == null ? null : nameAlt.contains('\'') == true ? '"$nameAlt"' : "'$nameAlt'"},
    bbox: $bbox,
    zoom: $zoom,
  );

''';
    },
  );

  final all = lakeNames.join(', ');

  return '''part of 'data.dart';

/// [Lake] constants that can be used to apply a custom [LakeStyle]
/// to a given Lake or multiple Lakes.
/// 
/// All lakes were read out from the
/// (50m natural earth lakes geoJson)[https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_50m_lakes.geojson]
abstract class Lakes {
  /// Filters all lakes by the given [predicate]. Shorthand for calling `Lakes.all.where(predicate).toList()`.
  static List<Lake> where(bool Function(Lake lake) predicate) => all.where(predicate).toList();

  /// Maps each lake to a [Color].
  static Map<Lake, Color> map(Color Function(Lake lake) iterator) =>
      Map.fromIterable(all, value: (value) => iterator(value as Lake));

  /// All lakes that are visible on a 50m earth vector.
  static const List<Lake> all = [$all];

$rivers
}
''';
}
