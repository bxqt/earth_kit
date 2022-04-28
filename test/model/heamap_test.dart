import 'package:earth_kit/earth_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const scale = ColorScale([
    ColorStop(-10.0, Colors.cyanAccent),
    ColorStop(0.0, Colors.cyan),
    ColorStop(5.0, Colors.lightBlue),
    ColorStop(10.0, Colors.blue),
    ColorStop(15.0, Colors.green),
    ColorStop(20.0, Colors.greenAccent),
    ColorStop(23.0, Colors.orange),
    ColorStop(25.0, Colors.deepOrange),
    ColorStop(28.0, Colors.redAccent),
    ColorStop(33.0, Colors.red),
    ColorStop(38.0, Colors.purpleAccent),
    ColorStop(42.0, Colors.purple),
    ColorStop(50.0, Colors.deepPurple),
  ]);

  test('Should lerp between the correct color stops', () async {
    // act
    // assert
    expect(
      scale.eval(-11.0),
      equals(Colors.cyanAccent),
    );
    expect(
      scale.eval(-5.0),
      equals(Color.lerp(Colors.cyanAccent, Colors.cyan, 0.5)),
    );
    expect(
      scale.eval(26.5),
      equals(Color.lerp(Colors.deepOrange, Colors.redAccent, 0.5)),
    );
    expect(
      scale.eval(50.0),
      equals(Colors.deepPurple),
    );
    expect(
      scale.eval(51.0),
      equals(Colors.deepPurple),
    );
  });
}
