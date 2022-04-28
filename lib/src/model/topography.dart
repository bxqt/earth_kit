import 'package:flutter/foundation.dart';

import '../util/util.dart';
import 'country.dart';
import 'model.dart';

class Topography {
  /// Either a TopoJson or a GeoJson to be used for countries (fill and stroke) for
  /// the specified [zoom].
  final String countries;

  /// Either a TopoJson or a GeoJson to be used for coastlines (fill and stroke) for
  /// the specified [zoom].
  ///
  /// The coastline is used to draw the default country color and the
  /// coastline stroke. Using the coastline instead of filling each country
  /// individually leads to massive performance improvements (unsurprinsingly).
  final String coastline;

  /// Either a TopoJson or a GeoJson to be used for rivers for
  /// the specified [zoom].
  final String? rivers;

  /// Either a TopoJson or a GeoJson to be used for rivers for
  /// the specified [zoom].
  final String? lakes;

  /// The zoom level at which this `Topology` should be used.
  ///
  /// Zoom levels range from `0..20` where `0` represent the minimum zoom
  /// (fully zoomed out) and `20` the maximum zoom (fully zoomed in).
  ///
  /// The `zoom` is only relevant when specifyng multiple topologies. For example
  /// when you have two `Topologies` at zooms of `0` and `10` respectively, the first
  /// `Topology` would be used for zoom levels below `10` and the second for zoom levels
  /// greater or equal than `10`.
  final double zoom;

  /// Creates a Topology to be used for
  /// the specified zoom.
  const Topography({
    required this.countries,
    required this.coastline,
    this.rivers,
    this.lakes,
    this.zoom = 0,
  });

  static const String coastline50m = 'packages/earth_kit/data/land_50m.json';
  static const String coastline110m = 'packages/earth_kit/data/land_110m.json';

  static const String countries50m = 'packages/earth_kit/data/countries_50m.json';
  static const String countries110m = 'packages/earth_kit/data/countries_110m.json';

  static const String rivers50m = 'packages/earth_kit/data/rivers_50m.json';
  static const String rivers110m = 'packages/earth_kit/data/rivers_110m.json';

  static const String lakes50m = 'packages/earth_kit/data/lakes_50m.json';
  static const String lakes110m = 'packages/earth_kit/data/lakes_110m.json';

  static const Topography m50 = Topography(
    countries: countries50m,
    coastline: coastline50m,
    rivers: rivers50m,
    lakes: lakes50m,
  );

  static const Topography m110 = Topography(
    countries: countries110m,
    coastline: coastline110m,
    rivers: rivers110m,
    lakes: lakes110m,
  );

  static const List<Topography> defaults = [
    Topography(
      countries: countries110m,
      coastline: coastline110m,
      rivers: rivers110m,
      lakes: lakes110m,
    ),
    Topography(
      zoom: 10,
      countries: countries50m,
      coastline: coastline50m,
      rivers: rivers50m,
      lakes: lakes50m,
    ),
  ];

  Topography atZoom(double zoom) => copyWith(zoom: zoom);

  Topography copyWith({
    String? countries,
    String? coastline,
    String? rivers,
    String? lakes,
    double? zoom,
  }) {
    return Topography(
      countries: countries ?? this.countries,
      coastline: coastline ?? this.coastline,
      rivers: rivers ?? this.rivers,
      lakes: lakes ?? this.lakes,
      zoom: zoom ?? this.zoom,
    );
  }

  @override
  String toString() =>
      'Topology(countries: $countries, coastline: $coastline, zoom: $zoom)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Topography &&
        o.countries == countries &&
        o.coastline == coastline &&
        o.zoom == zoom;
  }

  @override
  int get hashCode => countries.hashCode ^ coastline.hashCode ^ zoom.hashCode;
}

class Topo {
  final double? zoom;
  final List<Shape> coastline;
  final List<Shape> borders;
  final Map<Country, List<Shape>> countries;
  final Map<River, List<Shape>> rivers;
  final Map<Lake, List<Shape>> lakes;
  Topo({
     this.zoom,
    required this.coastline,
    required this.countries,
    this.rivers = const {},
    this.lakes = const {},
  }) : borders = countries.values.expand((shape) => shape).toList();

  bool get hasRivers => rivers.isNotEmpty;
  bool get hasLakes => lakes.isNotEmpty;

  Topo takeEvery(int skip) {
    List<Shape> reduce(List<Shape> src) =>
        src.map((e) => Shape(e.takeEvery(skip))).toList();
    Map<T, List<Shape>> reduceMap<T>(Map<T, List<Shape>> src) =>
        src.map((key, value) => MapEntry(key, reduce(value)));

    return Topo(
      zoom: zoom,
      coastline: reduce(coastline),
      countries: reduceMap<Country>(countries),
      rivers: reduceMap<River>(rivers),
      lakes: reduceMap<Lake>(lakes),
    );
  }

  @override
  String toString() {
    return 'Topo(zoom: $zoom, coastline: $coastline, borders: $borders, countries: $countries, rivers: $rivers, lakes: $lakes)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Topo &&
        o.zoom == zoom &&
        listEquals(o.coastline, coastline) &&
        listEquals(o.borders, borders) &&
        mapEquals(o.countries, countries) &&
        mapEquals(o.rivers, rivers) &&
        mapEquals(o.lakes, lakes);
  }

  @override
  int get hashCode {
    return zoom.hashCode ^
        coastline.hashCode ^
        borders.hashCode ^
        countries.hashCode ^
        rivers.hashCode ^
        lakes.hashCode;
  }
}
