part of 'renderer.dart';

class ProjectionOutlineRenderer extends KRenderer with Renderable {
  ProjectionOutlineRenderer(EarthState state) : super(state);

  @override
  double get zIndex => 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    final style = theme.projectionOutlineStyle;
    drawStroke(projection.clipPath, style.color!, style.width);
  }
}

class GraticuleRenderer extends KRenderer with Renderable {
  GraticuleRenderer(EarthState state) : super(state);

  @override
  double get zIndex => 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);

    // clipProjection();
    // drawGraticules();
    earth.graticules.forEach(drawGraticule);
  }

  void drawGraticule(Graticule graticule) {
    final path = createPathForGraticule(graticule);

    drawStroke(path, graticule.color!, graticule.strokeWidth);
  }

  Path createPathForGraticule(Graticule graticule) {
    final start = graticule.coordinates.first;
    final end = graticule.coordinates.last;

    return createPathForCoordinates(
      List<LatLng>.generate(
        50,
        (index) => start.scaleTo(end, index / 50.0),
      ),
      clip: false,
    );
  }
}
