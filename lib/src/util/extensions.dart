import 'dart:math' as math;

import 'dart:ui';

typedef Predicate<T> = bool Function(T item);

extension NumExtensions<N extends num> on N {
  N atLeast(N value) => math.max(this, value);

  N atMost(N value) => math.min(this, value);

  N wrapAt(N lower, N upper) {
    return this < lower ? upper : this > upper ? lower : this;
  }

  double get radians => this * (math.pi / 180.0);
  double get degrees => this * (180.0 / math.pi);
}

extension DoubleExtensions on double {
  double? scaleTo(double b, double t) => lerpDouble(this, b, t);
}

extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull {
    try {
      return first;
    } catch (_) {
      return null;
    }
  }

  T? get lastOrNull {
    try {
      return last;
    } catch (_) {
      return null;
    }
  }

  T? find(Predicate<T> predicate) {
    for (final item in this) {
      if (predicate(item)) return item;
    }
    return null;
  }

  bool includes(Predicate<T> predicate) => find(predicate) != null;
}

extension ListExtension<T> on List<T> {
  T? getOrNull(dynamic index) {
    if (this == null) return null;

    try {
      return this[index];
    } catch (_) {
      return null;
    }
  }

  T getOrElse(dynamic index, T other) => getOrNull(index) ?? other;

  List<T> filter(Predicate<T> predicate) {
    final List<T> result = [];
    for (final item in this) {
      if (predicate(item)) result.add(item);
    }
    return result;
  }

  void sortBy(List<Comparable Function(T item)> fields) {
    sort((a, b) {
      for (final field in fields) {
        final r = field(a).compareTo(field(b));
        if (r != 0) {
          return r;
        }
      }

      return 0;
    });
  }

  List<T> takeEvery(int skip) {
    final List<T> result = [];

    for (var i = 0; i < length; i++) {
      if (i % skip == 0 || i == (length - 1)) {
        result.add(this[i]);
      }
    }

    return result;
  }
}
