part of 'property_parser.dart';

String _createCountryFile(topo) {
  final List<Country> countries = [];
  final countriesStr = _createIteratively(
    topo,
    (feature, properties) {
      final name = properties['ADMIN'];
      final continent = properties['CONTINENT'];
      final isoA3 = properties['ISO_A3'];
      final code = properties['ISO_A2'];
      final economy = properties['ECONOMY'];
      final population = properties['POP_EST'];
      final medianGDP = properties['GDP_MD_EST'].round();

      final shapes = _parseGeometry(feature['geometry']);
      final bbox = _parseBBox(shapes);

      final country = Country(
        name: name,
        code: code,
        isoA3: isoA3,
        bbox: bbox,
        economy: economy,
        population: population,
        medianGDP: medianGDP,
        continent: continent,
      );

      countries.add(country);

      return country.toString();
    },
  );

  final continents = _createContinentsAccessors(countries);
  final maps = _createISOMaps(countries);

  return '''part of 'data.dart';

/// [Country] constants that can be used to apply a custom [CountryStyle]
/// to a given Country or multiple Countries.
abstract class Countries {
  /// Filters all countries by the given [predicate]. Shorthand for calling `Countries.all.where(predicate).toList()`.
  static List<Country> where(bool Function(Country country) predicate) => all.where(predicate).toList();

  /// Maps every [Country] to a [CountryStyle].
  static Map<Country, CountryStyle> map(CountryStyle Function(Country country) iterator) =>
      Map.fromIterable(all, value: (value) => iterator(value as Country));

  /// All countries that are available.
  static const List<Country> all = [${countries.map((e) => e.varName).join(', ')}];

  /// All current member states of the Europen Union.
  static const List<Country> eu = [austria, belgium, bulgaria, croatia, cyprus, czechia, denmark, estonia, finland, france, germany, greece, hungary, ireland, italy, latvia, lithuania, luxembourg, malta, netherlands, poland, portugal, romania, slovakia, slovenia, spain, sweden];

$continents

$maps

$countriesStr
}
''';
}



String _createISOMaps(List<Country> countries) {
  countries = List.from(countries)
    ..removeWhere((element) => element.code == '-99' || element.isoA3 == '-99');
  final isoA2 = countries.map((e) => "'${e.code}':Countries.${e.varName}").join(',');
  final isoA3 = countries.map((e) => "'${e.isoA3}':Countries.${e.varName}").join(',');

  return '''
  /// ISO-A2 to Country mappings.
  static const Map<String, Country> isoA2 = {$isoA2};

  /// ISO-A3 to Country mappings.
  static const Map<String, Country> isoA3 = {$isoA3};''';
}

String _createContinentsAccessors(List<Country> countries) {
  String result = '';
  final continents = countries.groupBy((item) => item.continent);
  for (final continent in continents) {
    final continentName = continent.first.continent.varName;
    if (continentName == 'antarctica') continue;

    final countries = continent.map((c) => c.varName).join(', ');
    result +=
        '  /// All countries that belong geographically to ${continent.first.continent}.\n';
    result += '  static const List<Country> $continentName = [$countries];\n\n';
  }

  return result.substring(0, result.length - 2);
}
