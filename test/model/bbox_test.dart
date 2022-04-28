import 'package:earth_kit/earth_kit.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: prefer_const_constructors

void main() {
  group('Factories', () {
    test('Should create a BBox from the center with the given radius', () async {
      // arrange
      const center = LatLng.primeMeridian;
      // act
      final bbox = BBox.square(center, 45.0);
      // assert
      expect(bbox.topLeft, LatLng(45, -45));
      expect(bbox.topRight, LatLng(45, 45));
      expect(bbox.bottomLeft, LatLng(-45, -45));
      expect(bbox.bottomRight, LatLng(-45, 45));
    });

    test('Should create a BBox from the given arguments when possible', () async {
      // arrange
      const topLeft = LatLng(55, -45);
      const bottomRight = LatLng(-3, 77);
      // act
      final bbox = BBox.of(topLeft: topLeft, bottomRight: bottomRight);
      // assert
      expect(bbox.topLeft, LatLng(55, -45));
      expect(bbox.topRight, LatLng(55, 77));
      expect(bbox.bottomLeft, LatLng(-3, -45));
      expect(bbox.bottomRight, LatLng(-3, 77));
    });

    test('Should create a BBox from the given countries', () async {
      // arrange
      final countries = [
        Country(bbox: BBox(LatLng(-45, -45), LatLng(45, 45))),
        Country(bbox: BBox(LatLng(60, -110), LatLng(70, -60))),
      ];
      // act
      final bbox = countries.bbox;
      // assert
      expect(
        bbox,
        equals(BBox(LatLng(-45, -110), LatLng(70, 45))),
      );
    });
  });
}
