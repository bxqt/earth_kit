part of 'renderer.dart';

late List<Star> _stars;

class AstroRenderer extends KRenderer with Renderable {
  AstroRenderer(EarthState state) : super(state);

  @override
  double get zIndex => -1.0;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    drawEarthGlow();
  }

  void drawEarthGlow() {
    if (theme.earthGlow!.opacity == 0.0) return;

    canvas.drawCircle(
      center,
      size.shortestSide * 0.55,
      Paint()
        ..color = theme.earthGlow!
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 32),
    );
  }

  void createStars() {
    _stars = List.generate(100, (_) => Star.random());
  }

  void drawStars() {
    for (final star in _stars) {
      canvas.drawCircle(
        center,
        star.z!,
        Paint()..color = Colors.blue,
      );
    }
  }
}

class Star {
  final LatLng latLng;
  final double? z;
  Star(this.latLng, this.z);

  factory Star.random() {
    final rnd = Random();

    return Star(
      LatLng(
        lerpDouble(-90.0, 90.0, rnd.nextDouble())!,
        lerpDouble(-180.0, 180.0, rnd.nextDouble())!,
      ),
      lerpDouble(0.5, 3.0, rnd.nextDouble()),
    );
  }
}
