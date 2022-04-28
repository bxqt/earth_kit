import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model.dart';
import 'override_theme.dart';

class River {
  final String? name;
  final double zoom;
  final String englishName;
  final BBox? bbox;
  const River({
    required this.name,
    this.zoom = 0.0,
    this.englishName = '',
    this.bbox,
  });

  @override
  String toString() {
    return 'River(name: $name, zoom: $zoom, englishName: $englishName, bbox: $bbox)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is River &&
        o.name == name &&
        o.zoom == zoom &&
        o.englishName == englishName &&
        o.bbox == bbox;
  }

  @override
  int get hashCode {
    return name.hashCode ^ zoom.hashCode ^ englishName.hashCode ^ bbox.hashCode;
  }
}

class RiverTheme {
  final Stroke defaultStyle;
  final Map<River, Stroke> overrides;
  RiverTheme({
    this.defaultStyle = const Stroke(color: Colors.lightBlue),
    Map<dynamic, Stroke> overrides = const {},
  }) : overrides = createOverrides<River, Stroke>(overrides);

  static final RiverTheme none = RiverTheme(defaultStyle: Stroke.none);

  Stroke style(River river) => overrides[river] ?? defaultStyle;

  RiverTheme scaleTo(RiverTheme b, double t) {
    return RiverTheme(
      defaultStyle: defaultStyle.scaleTo(b.defaultStyle, t),
      overrides: overrides.scaleTo(b.overrides, t) as Map<dynamic, Stroke>,
    );
  }

  @override
  String toString() => 'RiverTheme(defaultStyle: $defaultStyle, overrides: $overrides)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RiverTheme &&
        o.defaultStyle == defaultStyle &&
        mapEquals(o.overrides, overrides);
  }

  @override
  int get hashCode => defaultStyle.hashCode ^ overrides.hashCode;
}
