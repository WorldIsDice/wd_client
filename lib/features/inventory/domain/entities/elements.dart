enum Element {
  fire,
  water,
  ice,
  dark,
  holy,
  chaos,
  unknown,
}

Element getElement(int element) {
  return Element.values.firstWhere((Element elem) => elem.index == element, orElse: () => Element.unknown);
}
