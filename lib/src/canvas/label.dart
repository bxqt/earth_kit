/* part of 'renderer.dart';

class LabelRenderer extends Renderer {
  @override
  void render() {
    for (final country in Countries.all) {
      drawLabel(
        country.bbox,
        country.name,
        TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      );
    }
  }

  void drawLabel(BBox bbox, String text, TextStyle style) {
    if (shouldClip(bbox.center)) return;

    final center = project(bbox.center);
    final maxWidth = project(bbox.topRight).dx - project(bbox.bottomLeft).dx;

    if (maxWidth <= 0.0) return;

    final span = TextSpan(text: text, style: style);
    final painter = TextPainter(
      text: span,
      ellipsis: '...',
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    painter.layout();
    final width = painter.width;
    final height = painter.height;

    if (width >= maxWidth) return;

    painter.paint(
      canvas,
      Offset(
        center.dx - (width / 2),
        center.dy - (height / 2),
      ),
    );
  }

  @override
  double get zIndex => 2.0;
}
 */