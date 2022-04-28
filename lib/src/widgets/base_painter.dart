import 'package:flutter/material.dart';

abstract class BasePainter extends CustomPainter {
  late Canvas canvas;
  late Size size;

  double get width => size.width;
  double get height => size.height;
  double get centerX => width / 2;
  double get centerY => height / 2;
  Offset get center => Offset(centerX, centerY);

  Rect get drawingArea => Rect.fromLTWH(0, 0, width, height);

  @override
  void paint(Canvas canvas, Size size) {
    this.canvas = canvas;
    this.size = size;
  }

  void clipDrawingArea() => canvas.clipRect(Rect.fromLTWH(0, 0, width, height));

  void save() => canvas.save();
  void restore() => canvas.restore();

  void rotate(double radians, {Offset? center}) {
    center ??= this.center;
    canvas
      ..translate(center.dx, center.dy)
      ..rotate(radians)
      ..translate(-center.dx, -center.dy);
  }
}
