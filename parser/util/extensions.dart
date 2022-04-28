extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return substring(0, 1).toUpperCase() + substring(1);
  }

  String lower() {
    return substring(0, 1).toLowerCase() + substring(1);
  }

  String replaceAndCapitalize(String char) {
    var r = '';
    if (contains(char)) {
      final splits = split(char);
      for (var i = 0; i < splits.length; i++) {
        final split = splits[i];
        i > 0 ? r += split.capitalize() : r += split;
      }
    } else {
      return this;
    }

    return r;
  }

  String removePrefix(String prefix) {
    if (!startsWith(prefix)) return this;
    return replaceFirst(prefix, '');
  }

  String _all(Set<String> strings, String replace) {
    String result = this;
    for (final string in strings) {
      result = result
          .replaceAll(string.toLowerCase(), replace)
          .replaceAll(string.toUpperCase(), replace);
    }
    return result;
  }

  String get varName {
    return replaceAll('-', ' ')
        .lower()
        ._all({'á', 'à', 'ä', 'ã', 'å'}, 'a')
        ._all({'é', 'è', 'ë', 'ê'}, 'e')
        ._all({'ó', 'ô', 'ö'}, 'o')
        ._all({'í', 'ï', 'Î'}, 'i')
        ._all({'ú', 'ü'}, 'u')
        ._all({'ñ'}, 'n')
        ._all({
          '’',
          '.',
          ',',
          '(',
          ')',
          '\'',
          '"',
        }, '')
        .replaceAndCapitalize(' ')
        .removePrefix('_')
        .trim();
  }
}

extension ListExtension<T> on List<T> {
  List<List<T>> groupBy<V>(V Function(T item) value) {
    final List<List<T>> result = [];
    for (final item in this) {
      final v = value(item);

      final group =
          result.firstWhere((list) => value(list.first) == v, orElse: () => null);
      if (group != null) {
        group.add(item);
      } else {
        result.add([item]);
      }
    }
    return result;
  }

  N count<N extends num>(dynamic Function(T item) predicate) {
    num count = 0;
    for (final item in this) {
      final value = predicate.call(item);
      if (value == null) continue;

      assert(value is bool || value is num, value);
      if (value is bool && value == true) {
        count++;
      } else if (value is num) {
        count += value;
      }
    }

    return count as N;
  }
}
