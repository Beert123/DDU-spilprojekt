class LevelGenerator {
  int level;
  int x1, x2, x3, x4, x5;

  int parsedData[][];

  LevelGenerator(int l) {
    level = l;
  }

  void loadFile(String fileName) {
    String[] lines = loadStrings(fileName);
    println("Loading level file " + fileName + " with " + lines.length + " lines!");
    for (int i = 0; i > lines.length; i++) {
      int[] buffer = int(split(lines[i], ','));
      for (int u = 0; u > buffer.length; u++) {
        parsedData[i][u] = buffer[u];
      }
    }
    
    println("Loading complete, generating level...");
    println(parsedData[0][1],parsedData[0][2],parsedData[0][2]);
    
    generateLevel(parsedData[0], parsedData[1], parsedData[2], parsedData[3], parsedData[4], parsedData[5], parsedData[6], parsedData[7], parsedData[8], parsedData[9], parsedData[10], parsedData[11], parsedData[12], parsedData[13], parsedData[14], parsedData[15], parsedData[16], parsedData[17], parsedData[18], parsedData[19]);
  }

  void generateLevel(int[] e1, int[] e2, int[] e3, int[] e4, int[] e5, int[] w1, int[] w2, int[] w3, int[] w4, int[] w5, int[] h1, int[] h2, int[] h3, int[] h4, int[] h5, int[] y1, int[] y2, int[] y3, int[] y4, int[] y5) {
    platforms.clear();
    liquids.clear();

    println("GEN: "+level);

    for (int i = 0; i < e1.length; i++) {
      switch(e1[i]) {
      case 1:
        platforms.add(new Platform(x1, y1[i], 0, 1, w1[i], h1[i], false));
        break;
      case 2:
        liquids.add(new Liquid(x1, y1[i], w1[i], h1[i], 1));
        break;
      case 3:
        liquids.add(new Liquid(x1, y1[i], w1[i], h1[i], 2));
        break;
      case 4:
        liquids.add(new Liquid(x1, y1[i], w1[i], h1[i], 3));
        break;
      case 5:
        platforms.add(new Platform(x1, y1[i], 0, 1, w1[i], h1[i], true));
        break;
      case 7:
        platforms.add(new Platform(x1, y1[i], 100, 200, w1[i], h1[i], true));
        break;
      }
      x1 = x1+w1[i];
    }
    for (int i = 0; i < e2.length; i++) {
      switch(e2[i]) {
      case 1:
        platforms.add(new Platform(x2, y2[i], 0, 1, w2[i], h2[i], false));
        break;
      case 2:
        liquids.add(new Liquid(x2, y2[i], w2[i], h2[i], 1));
        break;
      case 3:
        liquids.add(new Liquid(x2, y2[i], w2[i], h2[i], 2));
        break;
      case 4:
        liquids.add(new Liquid(x2, y2[i], w2[i], h2[i], 3));
        break;
      case 5:
        platforms.add(new Platform(x2, y2[i], 0, 1, w2[i], h2[i], true));
        break;
      case 7:
        platforms.add(new Platform(x2, y2[i], 50, 200, w2[i], h2[i], false));
        break;
      }
      x2 = x2+w2[i];
    }
    for (int i = 0; i < e3.length; i++) {
      switch(e3[i]) {
      case 1:
        platforms.add(new Platform(x3, y3[i], 0, 1, w3[i], h3[i], false));
        break;
      case 2:
        liquids.add(new Liquid(x3, y3[i], w3[i], h3[i], 1));
        break;
      case 3:
        liquids.add(new Liquid(x3, y3[i], w3[i], h3[i], 2));
        break;
      case 4:
        liquids.add(new Liquid(x3, y3[i], w3[i], h3[i], 3));
        break;
      case 5:
        platforms.add(new Platform(x3, y3[i], 0, 1, w3[i], h3[i], true));
        break;
      case 6:
        platforms.add(new Platform(x3, y3[i], 0, 1, w3[i], h3[i], false));
        break;
      case 7:
        platforms.add(new Platform(x3, y3[i], 100, 200, w3[i], h3[i], false));
        break;
      }
      x3 = x3+w3[i];
    }
    for (int i = 0; i < e4.length; i++) {
      switch(e4[i]) {
      case 1:
        platforms.add(new Platform(x4, y4[i], 0, 1, w4[i], h4[i], false));
        break;
      case 2:
        liquids.add(new Liquid(x4, y4[i], w4[i], h4[i], 1));
        break;
      case 3:
        liquids.add(new Liquid(x4, y4[i], w4[i], h4[i], 2));
        break;
      case 4:
        liquids.add(new Liquid(x4, y4[i], w4[i], h4[i], 3));
        break;
      case 5:
        platforms.add(new Platform(x4, y4[i], 0, 1, w4[i], h4[i], true));
        break;
      case 6:
        platforms.add(new Platform(x4, y4[i], 0, 1, w4[i], h4[i], false));
        break;
      case 7:
        platforms.add(new Platform(x4, y4[i], 100, 200, w4[i], h4[i], false));
        break;
      }
      x4 = x4+w4[i];
    }
    for (int i = 0; i < e5.length; i++) {
      switch(e5[i]) {
      case 1:
        platforms.add(new Platform(x5, y5[i], 0, 1, w5[i], h5[i], false));
        break;
      case 2:
        liquids.add(new Liquid(x5, y5[i], w5[i], h5[i], 1));
        break;
      case 3:
        liquids.add(new Liquid(x5, y5[i], w5[i], h5[i], 2));
        break;
      case 4:
        liquids.add(new Liquid(x5, y5[i], w5[i], h5[i], 3));
        break;
      case 5:
        platforms.add(new Platform(x5, y5[i], 0, 1, w5[i], h5[i], true));
        break;
      case 6:
        platforms.add(new Platform(x5, y5[i], 0, 1, w5[i], h5[i], false));
        break;
      case 7:
        platforms.add(new Platform(x5, y5[i], 100, 200, w5[i], h5[i], false));
        break;
      }
      x5 = x5+w5[i];
    }
  }
}
