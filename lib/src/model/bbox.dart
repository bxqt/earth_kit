import 'dart:math' as math;

import 'package:earth_kit/earth_kit.dart';
import 'package:flutter/material.dart';

class BBox {
  final LatLng bottomLeft;
  final LatLng topRight;
  final EdgeInsets padding;
  const BBox(
    this.bottomLeft,
    this.topRight, {
    this.padding = EdgeInsets.zero,
  });


  static const BBox world = BBox(LatLng(-90.0, -180.0), LatLng(90.0, 180.0));

  factory BBox.square(LatLng center, double radius) {
    final num topLat = (center.latitude + radius).clamp(-90.0, 90.0);
    final num leftLon = (center.longitude - radius).clamp(-180.0, 180.0);
    final num bottomLat = (center.latitude - radius).clamp(-90.0, 90.0);
    final num rightLon = (center.longitude + radius).clamp(-180.0, 180.0);

    return BBox(LatLng(bottomLat as double, leftLon as double), LatLng(topLat as double, rightLon as double));
  }

  factory BBox.of({
    LatLng? topLeft,
    LatLng? topRight,
    LatLng? bottomLeft,
    LatLng? bottomRight,
  }) {
    assert((topLeft != null && bottomRight != null) ||
        (topRight != null || bottomLeft != null));

    final minLatitude = math.min((bottomLeft?.latitude ?? bottomRight?.latitude)!,
        (bottomRight?.latitude ?? bottomLeft?.latitude)!);
    final maxLatitude = math.max(
        (topLeft?.latitude ?? topRight?.latitude)!, (topRight?.latitude ?? topLeft?.latitude)!);

    final minLongitude = math.min((topLeft?.longitude ?? bottomLeft?.longitude)!,
        (bottomLeft?.longitude ?? topLeft?.longitude)!);
    final maxLongitude = math.max((topRight?.longitude ?? bottomRight?.longitude)!,
        (bottomRight?.longitude ?? topRight?.latitude)!);

    return BBox(LatLng(minLatitude, minLongitude), LatLng(maxLatitude, maxLongitude));
  }

  BBox scaleTo(BBox b, double t) {
    return BBox(
      bottomLeft.scaleTo(b.bottomLeft, t),
      topRight.scaleTo(b.topRight, t),
    );
  }

  double get height => (top + 90.0) - (bottom + 90.0);
  double get width => (right + 180.0) - (left + 180.0);
  double get left => bottomLeft.longitude;
  double get right => topRight.longitude;
  double get top => topLeft.latitude;
  double get bottom => bottomLeft.latitude;
  LatLng get center => bottomLeft.scaleTo(topRight, 0.5);
  LatLng get topLeft => LatLng(topRight.latitude, bottomLeft.longitude);
  LatLng get bottomRight => LatLng(bottomLeft.latitude, topRight.longitude);

  BBox withPadding(EdgeInsets padding) => BBox(bottomLeft, topRight, padding: padding);

  bool contains(LatLng latLng) {
    final isVerticallyInside =
        bottomLeft.latitude <= latLng.latitude && topRight.latitude >= latLng.latitude;
    final isHorizontallyInside = bottomLeft.longitude <= latLng.longitude &&
        topRight.longitude >= latLng.longitude;
    return isVerticallyInside && isHorizontallyInside;
  }

  @override
  String toString() => 'BBox(bottomLeft: $bottomLeft, topRight: $topRight)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BBox && o.bottomLeft == bottomLeft && o.topRight == topRight;
  }

  @override
  int get hashCode => bottomLeft.hashCode ^ topRight.hashCode;
}

extension BBoxCountryExtensionFactory on List<Country> {
  BBox get bbox {
    if (isEmpty) return BBox.world;

    final bbox = this[0].bbox!;

    double minLat = bbox.bottom, maxLat = bbox.top;
    double minLon = bbox.left, maxLon = bbox.right;

    for (final country in this) {
      final bbox = country.bbox!;

      if (bbox.bottom < minLat) minLat = bbox.bottom;
      if (bbox.top > maxLat) maxLat = bbox.top;

      if (bbox.left < minLon) minLon = bbox.left;
      if (bbox.right > maxLon) maxLon = bbox.right;
    }

    return BBox(
      LatLng(minLat, minLon),
      LatLng(maxLat, maxLon),
    );
  }
}
