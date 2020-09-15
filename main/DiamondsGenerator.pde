class DiamondsGenerator {
  int level;

  DiamondsGenerator(int l) {
    level = l;
  }

  void generateDiamonds(int[] x, int[] y, int[] t, int amount) {
    for (int i = 0; i < amount; i++) {
      diamonds.add(new Diamond(x[i], y[i], 20, 20, t[i]));
    }
  }
}
