class Pair<A, B> {
  final A first;
  final B second;
  const Pair(
    this.first,
    this.second,
  );

  Pair<A, B> copyWith({
    A? first,
    B? second,
  }) {
    return Pair<A, B>(
      first ?? this.first,
      second ?? this.second,
    );
  }

  dynamic operator [](int i) {
    if (i < 0 || i > 1) throw RangeError.range(i, 0, 1);

    return i == 0 ? first : second;
  }

  @override
  String toString() => 'Pair(first: $first, second: $second)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Pair<A, B> && o.first == first && o.second == second;
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

class Triplet<A, B, C> {
  final A first;
  final B second;
  final C third;
  const Triplet(
    this.first,
    this.second,
    this.third,
  );

  Triplet<A, B, C> copyWith({
    A? first,
    B? second,
    C? third,
  }) {
    return Triplet<A, B, C>(
      first ?? this.first,
      second ?? this.second,
      third ?? this.third,
    );
  }

  @override
  String toString() => 'Triplet(first: $first, second: $second, third: $third)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Triplet<A, B, C> &&
        o.first == first &&
        o.second == second &&
        o.third == third;
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode ^ third.hashCode;
}
