import 'dart:math';
import 'dart:ui';

import 'package:earth_kit/earth_kit.dart';

bool inCircle(Offset point, Offset center, double radius) {
  final dx = point.dx - center.dx;
  final dy = point.dy - center.dy;

  return ((dx * dx) + (dy * dy)) <= (radius * radius);
}

extension RectExtensions on Rect {
  double get area => width * height;
}

extension ColorExtensions on Color {
  Color get transparent => withOpacity(0.0);

  List<double> get vec4 => [red / 255.0, green / 255.0, blue / 255.0, alpha / 255.0];

  bool get isOpaque => opacity > 0;
  bool get isTransparent => opacity <= 0;
}

extension PathExtensions on Path {
  void clipToBigCircle(Offset start, Offset end, double radius) {
    double angle(Offset offset) {
      final angle = atan2(offset.dx - radius, -(offset.dy - radius));
      return angle < 0.0 ? pi + (pi - angle.abs()) : angle;
    }

    final startAngle = angle(start);
    final endAngle = angle(end);
    final clockwise = () {
      if (startAngle > pi && endAngle < pi) {
        return true;
      } else if (startAngle < pi && endAngle > pi && (endAngle - startAngle) > pi) {
        return false;
      } else if (startAngle < endAngle) {
        return true;
      } else {
        return false;
      }
    }();

    lineTo(start.dx, start.dy);
    arcToPoint(
      end,
      radius: Radius.circular(radius),
      clockwise: clockwise,
    );
  }
}

List<LatLng> adaptiveResample(
  List<LatLng> coordinates,
  Offset Function(LatLng) project, {
  double epsilon = 0.1,
}) {
  final List<LatLng> result = [];

  List<LatLng> resample(LatLng c0, LatLng c1) {
    final p0 = project(c0);
    final p1 = project(c1);
    final x10 = p1.dx - p0.dx;
    final y10 = p1.dy - p0.dy;
    final d1 = (x10 * x10) + (y10 * y10);

    if (d1 > epsilon) {
      final c2 = c0.scaleTo(c1, 0.5);
      final p2 = project(c2);
      final x20 = p2.dx - p0.dx;
      final y20 = p2.dy - p0.dy;
      final dz = (y10 * x20) - (x10 * y20);

      if (dz * dz / d1 > epsilon) {
        return [
          ...resample(c0, c2),
          ...resample(c2, c1),
        ];
      }
    }

    return [c0, c1];
  }

  for (var i = 0; ++i < coordinates.length;) {
    result.addAll(
      resample(coordinates[i - 1], coordinates[i]),
    );
  }

  if (result.length == coordinates.length) {
    if (coordinates.length == 2) {
      final start = coordinates[0];
      final end = coordinates[1];
      result.add(start);
      for (var t = 0.0; t < 1.0; t += epsilon / 10) {
        final inter = start.scaleTo(end, t);
        result.add(inter);
      }
      result.add(end);
    } else {
      return coordinates;
    }
  }

  return result;
}

Path computeLinearPath(List<Offset> knots) {
  final path = Path();
  for (final knot in knots) {
    if (knot == knots.first) {
      path.moveTo(knot.dx, knot.dy);
    } else {
      path.lineTo(knot.dx, knot.dy);
    }
  }

  return path;
}

Path computeBezierPath(List<Offset> knots, {double smoothFactor = 1.0}) {
  if (knots.isEmpty) return Path();

  smoothFactor = smoothFactor.clamp(0.0, 1.0);

  if (smoothFactor == 0.0) {
    return computeLinearPath(knots);
  }

  smoothFactor *= 0.19;

  // Credits: http://www.jayway.com/author/andersericsson/
  int si(int setSize, int i) {
    if (i > setSize - 1) {
      return setSize - 1;
    } else if (i < 0) {
      return 0;
    } else {
      return i;
    }
  }

  double thisPointX;
  double thisPointY;
  double nextPointX;
  double nextPointY;
  double startDiffX;
  double startDiffY;
  double endDiffX;
  double endDiffY;
  double firstControlX;
  double firstControlY;
  double secondControlX;
  double secondControlY;

  final res = Path();
  res.moveTo(knots.first.dx, knots.first.dy);

  for (var i = 0; i < knots.length - 1; i++) {
    thisPointX = knots[i].dx;
    thisPointY = knots[i].dy;

    nextPointX = knots[i + 1].dx;
    nextPointY = knots[i + 1].dy;

    startDiffX = nextPointX - knots[si(knots.length, i - 1)].dx;
    startDiffY = nextPointY - knots[si(knots.length, i - 1)].dy;

    endDiffX = knots[si(knots.length, i + 2)].dx - thisPointX;
    endDiffY = knots[si(knots.length, i + 2)].dy - thisPointY;

    firstControlX = thisPointX + smoothFactor * startDiffX;
    firstControlY = thisPointY + smoothFactor * startDiffY;

    secondControlX = nextPointX - smoothFactor * endDiffX;
    secondControlY = nextPointY - smoothFactor * endDiffY;

    res.cubicTo(
      firstControlX,
      firstControlY,
      secondControlX,
      secondControlY,
      nextPointX,
      nextPointY,
    );
  }

  return res;
}
