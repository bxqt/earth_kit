import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bbox.dart';
import 'continent.dart';
import 'data/data.dart';
import 'economy.dart';
import 'model.dart';
import 'override_theme.dart';

class Country {
  final String? name;
  final String? code;
  final String? isoA3;
  final int? medianGDP;
  final Continent? continent;
  final int? population;
  final Economy? economy;
  final BBox? bbox;
  const Country({
    this.name,
    this.code,
    this.isoA3,
    this.medianGDP,
    this.continent,
    this.population,
    this.economy,
    this.bbox,
  });

  /// Tries to lookup a [Country] from the given [src],
  /// throwing if no one was found.
  factory Country.parse(String src) {
    if (src == null) throw const FormatException();

    final code = src.toUpperCase();
    if (Countries.isoA2.containsKey(code)) {
      return Countries.isoA2[code]!;
    }

    if (Countries.isoA3.containsKey(code)) {
      return Countries.isoA3[code]!;
    }

    final name = src.toLowerCase();
    for (final country in Countries.all) {
      if (country.name!.toLowerCase() == name) {
        return country;
      }
    }

    throw FormatException("Couldn't match $src to a Country!");
  }

  /// Tries to lookup a [Country] from the given [src],
  /// return null if no one was found.
  static Country? tryParse(String src) {
    try {
      return Country.parse(src);
    } on FormatException {
      return null;
    }
  }

  @override
  String toString() {
    return 'Country(name: $name, code: $code, isoA3: $isoA3, medianGDP: $medianGDP, continent: $continent, population: $population, economy: $economy, bbox: $bbox)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Country &&
        o.name == name &&
        o.code == code &&
        o.isoA3 == isoA3 &&
        o.medianGDP == medianGDP &&
        o.continent == continent &&
        o.population == population &&
        o.economy == economy &&
        o.bbox == bbox;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        code.hashCode ^
        isoA3.hashCode ^
        medianGDP.hashCode ^
        continent.hashCode ^
        population.hashCode ^
        economy.hashCode ^
        bbox.hashCode;
  }
}

class CountryStyle {
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;
  const CountryStyle({
    this.color = const Color(0xFF424242),
    this.shadowColor = Colors.black54,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.25,
    this.elevation = 0.0,
  });

  const CountryStyle.border(
    Color borderColor, {
    double borderThickness = 0.25,
  }) : this(
          borderColor: borderColor,
          borderWidth: borderThickness,
          color: Colors.transparent,
        );

  static const CountryStyle none = CountryStyle(
    color: Colors.transparent,
    borderWidth: 0.0,
    borderColor: Colors.transparent,
    elevation: 0.0,
    shadowColor: Colors.transparent,
  );

  bool get hasFill => color != null && color!.opacity > 0;
  bool get hasShadow => shadowColor != null && shadowColor!.opacity > 0 && elevation! > 0.0;
  bool get hasOutline =>
      borderColor != null && borderColor!.opacity > 0 && borderWidth! > 0;

  CountryStyle scaleTo(CountryStyle b, double t) {
    return CountryStyle(
      color: Color.lerp(color, b.color, t),
      shadowColor: Color.lerp(shadowColor, b.shadowColor, t),
      borderColor: Color.lerp(borderColor, b.borderColor, t),
      borderWidth: lerpDouble(borderWidth, b.borderWidth, t),
      elevation: lerpDouble(elevation, b.elevation, t),
    );
  }

  @override
  String toString() {
    return 'CountryStyle(color: $color, shadowColor: $shadowColor, borderColor: $borderColor, borderThickness: $borderWidth, elevation: $elevation)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CountryStyle &&
        o.color == color &&
        o.shadowColor == shadowColor &&
        o.borderColor == borderColor &&
        o.borderWidth == borderWidth &&
        o.elevation == elevation;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        shadowColor.hashCode ^
        borderColor.hashCode ^
        borderWidth.hashCode ^
        elevation.hashCode;
  }
}

class CountryTheme {
  final CountryStyle defaultStyle;
  final Map<Country, CountryStyle> overrides;
  CountryTheme({
    this.defaultStyle = const CountryStyle(),
    Map<dynamic, CountryStyle> overrides = const {},
  }) : overrides = createOverrides<Country, CountryStyle>(overrides);

  static final CountryTheme none = CountryTheme(defaultStyle: CountryStyle.none);

  CountryStyle style(Country country) => overrides[country] ?? defaultStyle;

  CountryTheme scaleTo(CountryTheme b, double t) {
    return CountryTheme(
      defaultStyle: defaultStyle.scaleTo(b.defaultStyle, t),
      overrides: overrides.scaleTo(b.overrides, t) as Map<dynamic, CountryStyle>,
    );
  }

  @override
  String toString() => 'CountryTheme(defaultStyle: $defaultStyle, overrides: $overrides)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CountryTheme &&
        o.defaultStyle == defaultStyle &&
        mapEquals(o.overrides, overrides);
  }

  @override
  int get hashCode => defaultStyle.hashCode ^ overrides.hashCode;
}
