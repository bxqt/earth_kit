import 'package:earth_kit/earth_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const hamburg = LatLng(53.5511, 9.9937);
  const munich = LatLng(48.1351, 11.5820);
  const copenhagen = LatLng(55.6761, 12.5683);
  const sanFrancisco = LatLng(37.7749, -122.4194);
  const singapore = LatLng(1.3521, 103.8198);
  const sydney = LatLng(-33.8688, 151.2093);

  test('Should correctly identify a LatLng inside or outside a BBox', () async {
    // arrange
    final bbox = Countries.germany.bbox;
    // assert
    expect(bbox.contains(hamburg), isTrue);
    expect(bbox.contains(munich), isTrue);
    expect(bbox.contains(copenhagen), isFalse);
    expect(bbox.contains(sanFrancisco), isFalse);
    expect(bbox.contains(singapore), isFalse);
    expect(bbox.contains(sydney), isFalse);
  });
}
