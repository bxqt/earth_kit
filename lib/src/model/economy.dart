enum Economy {
  developedG7,
  developedNonG7,
  emergingBRIC,
  emergingMIKT,
  emergingG20,
  developing,
}

extension EconomyExtensions on Economy {
  bool get isG7 => this == Economy.developedG7;
  bool get isG20 => isG7 || this == Economy.emergingG20;
  bool get isBRIC => this == Economy.emergingBRIC;
  bool get isMIKT => this == Economy.emergingMIKT;

  bool get isDeveloped => this == Economy.developedG7 || this == Economy.developedNonG7;
  bool get isEmerging => this == Economy.emergingBRIC || this == Economy.emergingG20 || this == Economy.emergingMIKT;
  bool get isDeveloping => this == Economy.developing;
}
