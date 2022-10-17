enum Element {
  Fire,
  Water,
  Ice,
  Dark,
  Holy,
  Chaos,
  Unknown,
}

Element getElement(int element) {
  return Element.values.firstWhere((Element elem) => elem.index == element, orElse: () => Element.Unknown);
}
