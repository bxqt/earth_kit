import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bbox.dart';
import 'override_theme.dart';

class Lake {
  final String? name;
  final String? nameAlt;
  final double zoom;
  final BBox? bbox;
  const Lake({
    required this.name,
    this.nameAlt = '',
    this.zoom = 0.0,
    this.bbox,
  });

  bool get hasBBox => bbox != null;
  bool get hasAltName => nameAlt != null && nameAlt != '';

  @override
  String toString() {
    return 'Lake(name: $name, nameAlt: $nameAlt, zoom: $zoom, bbox: $bbox)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Lake &&
        o.name == name &&
        o.nameAlt == nameAlt &&
        o.zoom == zoom &&
        o.bbox == bbox;
  }

  @override
  int get hashCode {
    return name.hashCode ^ nameAlt.hashCode ^ zoom.hashCode ^ bbox.hashCode;
  }
}

class LakeTheme {
  final Color? defaultColor;
  final Map<Lake, Color> overrides;
  LakeTheme({
    this.defaultColor = Colors.blue,
    Map<dynamic, Color> overrides = const {},
  }) : overrides = createOverrides(overrides);

  static final LakeTheme none = LakeTheme(defaultColor: Colors.transparent);

  Color? color(Lake lake) => overrides[lake] ?? defaultColor;

  LakeTheme scaleTo(LakeTheme b, double t) {
    return LakeTheme(
      defaultColor: Color.lerp(defaultColor, b.defaultColor, t),
      overrides: overrides.scaleTo(b.overrides, t) as Map<dynamic, Color>,
    );
  }

  @override
  String toString() => 'LakeTheme(defaultColor: $defaultColor, overrides: $overrides)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LakeTheme &&
        o.defaultColor == defaultColor &&
        mapEquals(o.overrides, overrides);
  }

  @override
  int get hashCode => defaultColor.hashCode ^ overrides.hashCode;
}
