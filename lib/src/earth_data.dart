import 'dart:ui';

import 'package:flutter/material.dart';

import '../earth_kit.dart';
import 'model/model.dart';

class EarthData {
  final EarthTheme theme;
  final CameraSpec options;
  const EarthData({
    required this.theme,
    required this.options,
  });

  EarthData scaleTo(
    EarthData b,
    double t, {
    Curve curve = Curves.linear,
    Curve cameraCurve = Curves.easeInOut,
  }) {
    final i = curve.transform(t);
    final c = cameraCurve.transform(t);

    return EarthData(
      theme: theme.scaleTo(b.theme, i),
      options: options.scaleTo(b.options, c),
    );
  }

  @override
  String toString() => '_EarthData(theme: $theme, options: $options)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EarthData && o.theme == theme && o.options == options;
  }

  @override
  int get hashCode => theme.hashCode ^ options.hashCode;
}

class EarthTheme {
  final Color? earthGlow;
  final Color waterColor;
  final Stroke coastlineStyle;
  final Stroke projectionOutlineStyle;
  final CountryTheme countryTheme;
  final RiverTheme riverTheme;
  final LakeTheme lakeTheme;
  final GraticuleTheme graticuleTheme;
  final PolygonTheme polygonTheme;
  EarthTheme({
    CountryTheme? countryTheme,
    RiverTheme? riverTheme,
    LakeTheme? lakeTheme,
    this.earthGlow = const Color(0x8A03A9F4),
    this.waterColor = const Color(0xFF1A1FB0),
    this.coastlineStyle = const Stroke(width: 2.0),
    this.projectionOutlineStyle = const Stroke(width: 3.0),
    this.graticuleTheme = const GraticuleTheme(),
    this.polygonTheme = const PolygonTheme(),
  })  : countryTheme = countryTheme ?? CountryTheme(),
        riverTheme = riverTheme ?? RiverTheme.none,
        lakeTheme = lakeTheme ?? LakeTheme.none;

  EarthTheme scaleTo(EarthTheme b, double t) {
    return EarthTheme(
      earthGlow: Color.lerp(earthGlow, b.earthGlow, t),
      waterColor: Color.lerp(waterColor, b.waterColor, t)!,
      coastlineStyle: coastlineStyle.scaleTo(b.coastlineStyle, t),
      countryTheme: countryTheme.scaleTo(b.countryTheme, t),
      riverTheme: riverTheme.scaleTo(b.riverTheme, t),
      lakeTheme: lakeTheme.scaleTo(b.lakeTheme, t),
      graticuleTheme: graticuleTheme.scaleTo(b.graticuleTheme, t),
      polygonTheme: polygonTheme.scaleTo(b.polygonTheme, t),
    );
  }

  @override
  String toString() {
    return 'EarthTheme(earthGlow: $earthGlow, waterColor: $waterColor, coastlineStyle: $coastlineStyle, projectionOutlineStyle: $projectionOutlineStyle, countryTheme: $countryTheme, riverTheme: $riverTheme, lakeTheme: $lakeTheme, graticuleTheme: $graticuleTheme, polygonTheme: $polygonTheme)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EarthTheme &&
        o.earthGlow == earthGlow &&
        o.waterColor == waterColor &&
        o.coastlineStyle == coastlineStyle &&
        o.projectionOutlineStyle == projectionOutlineStyle &&
        o.countryTheme == countryTheme &&
        o.riverTheme == riverTheme &&
        o.lakeTheme == lakeTheme &&
        o.graticuleTheme == graticuleTheme &&
        o.polygonTheme == polygonTheme;
  }

  @override
  int get hashCode {
    return earthGlow.hashCode ^
        waterColor.hashCode ^
        coastlineStyle.hashCode ^
        projectionOutlineStyle.hashCode ^
        countryTheme.hashCode ^
        riverTheme.hashCode ^
        lakeTheme.hashCode ^
        graticuleTheme.hashCode ^
        polygonTheme.hashCode;
  }
}

class CameraSpec {
  final LatLng origin;
  final double? zoom;
  final double? rotation;
  final BBox bbox;
  final bool allowUserPan;
  final bool allowUserZoom;
  final bool allowUserRotation;
  final double? minZoom;
  final double? maxZoom;
  const CameraSpec({
    this.origin = LatLng.primeMeridian,
    this.zoom = 1.0,
    this.rotation = 0.0,
    this.bbox = BBox.world,
    this.allowUserPan = true,
    this.allowUserZoom = true,
    this.allowUserRotation = false,
    this.minZoom = 0.25,
    this.maxZoom = 20.0,
  });

  CameraSpec scaleTo(CameraSpec b, double t) {
    return CameraSpec(
      origin: origin.scaleTo(b.origin, t),
      bbox: bbox.scaleTo(b.bbox, t),
      zoom: lerpDouble(zoom, b.zoom, t),
      rotation: lerpDouble(rotation, b.rotation, t),
      allowUserPan: b.allowUserPan,
      allowUserZoom: b.allowUserZoom,
      allowUserRotation: b.allowUserRotation,
      minZoom: lerpDouble(minZoom, b.minZoom, t),
      maxZoom: lerpDouble(maxZoom, b.maxZoom, t),
    );
  }

  CameraSpec copyWith({
    LatLng? origin,
    double? zoom,
    double? rotation,
    BBox? bbox,
    bool? allowUserPan,
    bool? allowUserZoom,
    bool? allowUserRotation,
    double? minZoom,
    double? maxZoom,
  }) {
    return CameraSpec(
      origin: origin ?? this.origin,
      zoom: zoom ?? this.zoom,
      rotation: rotation ?? this.rotation,
      bbox: bbox ?? this.bbox,
      allowUserPan: allowUserPan ?? this.allowUserPan,
      allowUserZoom: allowUserZoom ?? this.allowUserZoom,
      allowUserRotation: allowUserRotation ?? this.allowUserRotation,
      minZoom: minZoom ?? this.minZoom,
      maxZoom: maxZoom ?? this.maxZoom,
    );
  }

  @override
  String toString() {
    return 'CameraSpec(origin: $origin, zoom: $zoom, rotation: $rotation, bbox: $bbox, allowUserPan: $allowUserPan, allowUserZoom: $allowUserZoom, allowUserRotation: $allowUserRotation, minZoom: $minZoom, maxZoom: $maxZoom)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CameraSpec &&
        o.origin == origin &&
        o.zoom == zoom &&
        o.rotation == rotation &&
        o.bbox == bbox &&
        o.allowUserPan == allowUserPan &&
        o.allowUserZoom == allowUserZoom &&
        o.allowUserRotation == allowUserRotation &&
        o.minZoom == minZoom &&
        o.maxZoom == maxZoom;
  }

  @override
  int get hashCode {
    return origin.hashCode ^
        zoom.hashCode ^
        rotation.hashCode ^
        bbox.hashCode ^
        allowUserPan.hashCode ^
        allowUserZoom.hashCode ^
        allowUserRotation.hashCode ^
        minZoom.hashCode ^
        maxZoom.hashCode;
  }
}

class EarthState {
  final EarthKit earth;
  final EarthData? data;
  final List<Topo> topos;
  final CameraSpec camera;
  final EarthSnapshot snapshot;
  final Topo? topo;
  EarthState({
    required this.earth,
    required this.data,
    required this.topos,
    required this.camera,
    required this.snapshot,
  }) : topo = _getTopoForZoom(topos, snapshot);

  /// Whether the topography has been successfully
  /// loaded and is ready to display.
  /// 
  /// Renderers that depend on topographical data must
  /// wait for this flag to be true, before issuing any
  /// draw commands.
  bool get isReady => topo != null;

  static Topo? _getTopoForZoom(List<Topo> topos, EarthSnapshot snapshot) {
    final zoom = snapshot.zoom;
    final isMoving = snapshot.isMoving;

    for (var i = 0; i < topos.length; i++) {
      final topo = topos[i];
      final z = topo.zoom ?? (20 / topos.length) * i;

      if (z <= zoom!) {
        return topo;
        // Use the topography for the zoom level above
        // while moving.
        // _moveTopo = i > 0 ? topos[i - 1] : topo;
      }
    }

    return topos.isNotEmpty ? topos.first : null;
  }

  @override
  String toString() {
    return 'EarthState(earth: $earth, data: $data, topos: $topos, camera: $camera, snapshot: $snapshot)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EarthState &&
        o.earth == earth &&
        o.data == data &&
        o.topos == topos &&
        o.camera == camera &&
        o.snapshot == snapshot;
  }

  @override
  int get hashCode {
    return earth.hashCode ^
        data.hashCode ^
        topos.hashCode ^
        camera.hashCode ^
        snapshot.hashCode;
  }
}

class EarthSnapshot {
  final LatLng? origin;
  final double? zoom;
  final BBox bbox;
  final BBox bounds;
  final Size size;
  final Size parentSize;
  final bool isMoving;
  final Rect? visible;
  EarthSnapshot({
    required this.origin,
    required this.zoom,
    required this.bbox,
    required this.bounds,
    required this.size,
    required this.parentSize,
    required this.isMoving,
    required this.visible,
  });

  @override
  String toString() {
    return 'EarthSnapshot(origin: $origin, zoom: $zoom, bbox: $bbox, bounds: $bounds, size: $size, parentSize: $parentSize, isMoving: $isMoving, visible: $visible)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EarthSnapshot &&
        o.origin == origin &&
        o.zoom == zoom &&
        o.bbox == bbox &&
        o.bounds == bounds &&
        o.size == size &&
        o.parentSize == parentSize &&
        o.isMoving == isMoving &&
        o.visible == visible;
  }

  @override
  int get hashCode {
    return origin.hashCode ^
        zoom.hashCode ^
        bbox.hashCode ^
        bounds.hashCode ^
        size.hashCode ^
        parentSize.hashCode ^
        isMoving.hashCode ^
        visible.hashCode;
  }
}
