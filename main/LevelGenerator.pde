class LevelGenerator {
  int level;
  
  
  LevelGenerator(int l) {
    level = l;
  }
  
  void generateLevel(int[] e1, int[] e2, int[] e3) {
    for (int i = 0; i < e1.length; i++) {
      switch(e1[i]) {
        case 1:
          platforms.add(new Platform(0+i*200, 180, 0, 1, 200, 50));
          break;
      }
    }
    for (int i = 0; i < e2.length; i++) {
      switch(e2[i]) {
        case 1:
          platforms.add(new Platform(0+i*200, 400, 0, 1, 200, 50));
          break;
      }
    }
    for (int i = 0; i < e3.length; i++) {
      switch(e3[i]) {
        case 1:
          platforms.add(new Platform(0+i*200, 650, 0, 1, 200, 50));
          break;
      }
    }
  }
}
