part of 'model.dart';

class Country {
  final String name;
  final String code;
  final String isoA3;
  final int medianGDP;
  final String continent;
  final int population;
  final String economy;
  final BBox bbox;
  Country({
    @required String name,
    @required this.code,
    @required this.isoA3,
    @required this.medianGDP,
    @required String continent,
    @required this.population,
    @required this.economy,
    @required this.bbox,
  })  : name = fixCountryName(name),
        continent = fixContinentName(continent);

  static String fixCountryName(String name) {
    if (name == 'Hong Kong S.A.R.') {
      return 'Hong Kong';
    } else if (name == 'Macao S.A.R') {
      return 'Macao';
    } else if (name == 'Bajo Nuevo Bank (Petrel Is.)') {
      return 'Bajo Nuevo Bank';
    }

    return name;
  }

  static String fixContinentName(String continent) {
    if (continent == 'Seven seas (open ocean)') {
      return 'Open Ocean';
    }

    return continent;
  }

  String get varName {
    if (name == 'Curaçao') {
      return 'curacao';
    } else if (name == 'United States of America') {
      return 'usa';
    } else {
      return name.varName;
    }
  }

  String get continentEnum {
    switch (continent) {
      case 'Europe':
        return 'Continent.europe';
      case 'North America':
        return 'Continent.northAmerica';
      case 'South America':
        return 'Continent.southAmerica';
      case 'Africa':
        return 'Continent.africa';
      case 'Asia':
        return 'Continent.asia';
      case 'Oceania':
        return 'Continent.oceania';
      case 'Open Ocean':
        return 'Continent.openOcean';
      case 'Antarctica':
        return 'Continent.antarctica';
      default:
        throw StateError(continent);
    }
  }

  String get economyEnum {
    switch (economy) {
      case '1. Developed region: G7':
        return 'Economy.developedG7';
      case '2. Developed region: nonG7':
        return 'Economy.developedNonG7';
      case '3. Emerging region: BRIC':
        return 'Economy.emergingBRIC';
      case '4. Emerging region: MIKT':
        return 'Economy.emergingMIKT';
      case '5. Emerging region: G20':
        return 'Economy.emergingG20';
      case '6. Developing region':
      case '7. Least developed region':
        return 'Economy.developing';
      default:
        throw StateError(economy);
    }
  }

  @override
  String toString() {
    return '''const Country $varName = Country(
    name: '$name',
    code: '$code',
    isoA3: '$isoA3',
    continent: $continentEnum,
    medianGDP: $medianGDP,
    population: $population,
    economy: $economyEnum,
    bbox: $bbox,
  );\n\n''';
  }
}
