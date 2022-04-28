

Map<T, S> createOverrides<T, S>(Map<dynamic, S> overrides) {
  final Map<T, S> result = {};
  overrides.forEach((key, value) {
    assert(key is T || key is Iterable<T>);
    if (key is T) {
      result[key] = value;
    } else if (key is Iterable<T>) {
      for (final k in key) {
        result[k] = value;
      }
    }
  });
  return result;
}

extension OverrideScaleExtension<Key, Style> on Map<Key, Style> {
  Map<Key, Style?> scaleTo(Map<Key, Style> b, double t) {
    final Map<Key, Style?> result = {};
    if (isEmpty) return b;

    for (final key in b.keys) {
      final newStyle = b[key];
      final oldStyle = this[key];
      if (oldStyle != null && newStyle != null) {
        result[key] = (oldStyle as dynamic).scaleTo(newStyle, t);
      } else if (newStyle != null) {
        result[key] = newStyle;
      }
    }

    return result;
  }
}
