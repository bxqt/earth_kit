import 'package:flutter/material.dart';

export 'extensions.dart';
export 'rendering.dart';
export 'tuples.dart';

void postFrame(void Function() callback) {
  WidgetsBinding.instance!.addPostFrameCallback(
    (_) => callback(),
  );
}

double interval(double begin, double end, double t) {
  return ((t - begin) / (end - begin)).clamp(0.0, 1.0);
}
