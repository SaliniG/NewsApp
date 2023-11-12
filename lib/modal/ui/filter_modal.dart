class Filter {
  String name;
  String value;

  Filter({
    required this.name,
    required this.value,
  });

  @override
  bool operator ==(other) => other is Filter && name == other.name && value == other.value;

  @override
  int get hashCode => Object.hash(name.hashCode, value.hashCode);
}
