extension ListManipulations<T> on List<T> {
  List<T> insertBetween(T item) {
    return length > 1
        ? (expand((element) => [element, item]).toList()..removeLast())
        : this;
  }

  List<T> insertFromMap(Map<int, T> items) {
    List<T> list = this;
    items.forEach((index, element) {
      if (index <= list.length) {
        list.insert(index, element);
      } else {
        list.add(element);
      }
    });
    return list;
  }
}
