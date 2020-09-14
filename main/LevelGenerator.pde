class LevelGenerator {
  int level;
  int x1, x2, x3;

  LevelGenerator(int l) {
    level = l;
  }

  void generateLevel(int[] e1, int[] e2, int[] e3, int[] w1, int[] w2, int[] w3) {
    for (int i = 0; i < e1.length; i++) {
      switch(e1[i]) {
      case 1:
        platforms.add(new Platform(x1, 180, 0, 1, w1[i], 40, false));
        break;
      case 2:
        liquids.add(new Liquid(x1, 180, w1[i], 40, 1));
        break;
      case 3:
        liquids.add(new Liquid(x1, 180, w1[i], 40, 2));
        break;
      case 4:
        liquids.add(new Liquid(x1, 180, w1[i], 40, 3));
        break;
      case 5:
        platforms.add(new Platform(x1, 180, 0, 1, w1[i], 40, true));
        break;
      }
      x1 = x1+w1[i];
    }
    for (int i = 0; i < e2.length; i++) {
      switch(e2[i]) {
      case 1:
        platforms.add(new Platform(x2, 400, 0, 1, w2[i], 40, false));
        break;
      case 2:
        liquids.add(new Liquid(x2, 400, w2[i], 40, 1));
        break;
      case 3:
        liquids.add(new Liquid(x2, 400, w2[i], 40, 2));
        break;
      case 4:
        liquids.add(new Liquid(x2, 400, w2[i], 40, 3));
        break;
      case 5:
        platforms.add(new Platform(x2, 400, 0, 1, w2[i], 40, true));
        break;
      }
      x2 = x2+w2[i];
    }
    for (int i = 0; i < e3.length; i++) {
      switch(e3[i]) {
      case 1:
        platforms.add(new Platform(x3, 650, 0, 1, w3[i], 40, false));
        break;
      case 2:
        liquids.add(new Liquid(x3, 650, w3[i], 40, 1));
        break;
      case 3:
        liquids.add(new Liquid(x3, 650, w3[i], 40, 2));
        break;
      case 4:
        liquids.add(new Liquid(x3, 650, w3[i], 40, 3));
        break;
      case 5:
        platforms.add(new Platform(x3, 650, 0, 1, w3[i], 40, true));
        break;
      case 6:
        platforms.add(new Platform(x3, 650-40, 0, 1, w3[i], 80, false));
        break;
      }
      x3 = x3+w3[i];
    }
  }
}
