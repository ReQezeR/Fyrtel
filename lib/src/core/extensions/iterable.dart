extension NullOrEmptyHelper on Iterable? {
  bool get isNullOrEmpty => this == null || (this != null && this!.isEmpty);
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
