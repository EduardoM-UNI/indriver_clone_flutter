class BlocFormitem {

  final String value;
  final String? error;

  const BlocFormitem({
    this.value = '',
    this.error
  });

  BlocFormitem copyWith({
      String?  value,
      String? error,
  }) {
      return BlocFormitem(
        value: value ?? this.value,
        error: error ?? this.error
      );
  }
}