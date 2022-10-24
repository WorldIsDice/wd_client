enum GameElement {
  fire,
  water,
  ice,
  dark,
  holy,
  chaos,
  unknown,
}

GameElement getElement(int element) {
  return GameElement.values.firstWhere((GameElement elem) => elem.index == element, orElse: () => GameElement.unknown);
}
