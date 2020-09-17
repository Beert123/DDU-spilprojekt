import processing.net.*;
int level;
Server s;
Client c;
String input;
float data[];
PImage platformImg;
PImage diamondred;
PImage diamondblue;

ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Maal> maal = new ArrayList<Maal>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Liquid> liquids = new ArrayList<Liquid>();
ArrayList<Diamond> diamonds = new ArrayList<Diamond>();
ArrayList<Drip> drips = new ArrayList<Drip>();
Player player1 = new Player(50, 600, 1, 30, 60);
Player player2 = new Player(50, 700, 2, 30, 60);
LevelGenerator gen = new LevelGenerator(1);
LevelGenerator gen2 = new LevelGenerator(2);
LevelGenerator gen3 = new LevelGenerator(3);
DiamondsGenerator genD = new DiamondsGenerator(1);
DiamondsGenerator genD2 = new DiamondsGenerator(2);
DiamondsGenerator genD3 = new DiamondsGenerator(3);
Menu menu;

boolean server = true;
boolean levelDrawn, ready, firstInit;
int levelId;

//LEVEL 1

int[] e1 = {0, 1, 1, 1};
int[] e2 = {5, 1, 1, 1, 1, 1};
int[] e3 = {0, 1, 1, 1, 1, 0};
int[] e4 = {5, 1, 1, 1, 4, 1};
int[] e5 = {1, 1, 1, 1, 3, 1, 2, 1, 5};
int[] w1 = {200, 50, 150, 600};
int[] w2 = {100, 400, 200, 50, 150, 100};
int[] w3 = {200, 200, 50, 300, 150, 100};
int[] w4 = {150, 150, 50, 150, 150, 150};
int[] w5 = {220, -220, 220, 130, 100, 200, 100, 100, 150};
int[] h1 = {40, 60, 100, 40};
int[] h2 = {120, 40, 80, 100, 60, 40};
int[] h3 = {40, 40, 60, 40, 80, 40};
int[] h4 = {40, 40, 90, 40, 40, 40};
int[] h5 = {40, 20, 20, 40, 40, 40, 40, 40, 100};
int[] y1 = {110, 90, 110, 110};
int[] y2 = {200, 280, 240, 240, 280, 300};
int[] y3 = {400, 400, 400, 420, 420, 460};
int[] y4 = {550, 550, 550, 600, 600, 600};
int[] y5 = {760, 670, 670, 760, 760, 760, 760, 760, 700};

int[] x = {390, 690, 795, 30, 265, 665};
int[] y = {680, 680, 225, 485, 350, 370};
int[] t = {1, 2, 1, 2, 1, 2};

//END LEVEL 1

// LEVEL 2

int[] ee1 = {1, 1, 1, 1, 1};
int[] ee2 = {0, 1, 4, 1, 4, 1, 1, 1, 0, 7, 0, 0, 7, 0};
int[] ee3 = {1, 1, 1, 1};
int[] ee4 = {0, 1, 3, 1, 0, 1, 2, 1};
int[] ee5 = {1, 2, 1, 3, 1, 5};
int[] ww1 = {350, 200, 175, 50, 75};
int[] ww2 = {150, 50, 200, 150, 200, 75, 75, 100, -750, 100, 150, 100, 100, 100};
int[] ww3 = {100, 380, 40, 380};
int[] ww4 = {200, 20, 160, 20, 200, 20, 160, 20};
int[] ww5 = {160, 280, 120, 280, 60, 100};
int[] hh1 = {40, 40, 40, 110, 40};
int[] hh2 = {40, 40, 40, 60, 40, 40, 100, 160, 40, 40, 40, 40, 40, 40};
int[] hh3 = {120, 40, 180, 40};
int[] hh4 = {40, 40, 40, 40, 40, 40, 40, 40};
int[] hh5 = {40, 40, 40, 40, 40, 100};
int[] yy1 = {110, -40, 110, 110, 180};
int[] yy2 = {380, 380, 380, 360, 380, 380, 320, 260, 300, 300, 300, 300, 300, 300};
int[] yy3 = {460, 540, 400, 540};
int[] yy4 = {680, 680, 680, 680, 680, 680, 680, 680};
int[] yy5 = {760, 760, 760, 760, 760, 700};

int[] xx = {695, 290, 635, 285, 500, 410};
int[] yy = {640, 640, 250, 250, 55, 55};
int[] tt = {1, 2, 1, 2, 1, 2};

// END LEVEL 2

// LEVEL 3

int[] eee1 = {0, 1, 0, 1, 0};
int[] eee2 = {0, 5, 1, 1, 1, 1, 1, 5, 0};
int[] eee3 = {5, 4, 1, 5, 0, 5, 1, 4, 5};
int[] eee4 = {1, 1, 5, 1, 1};
int[] eee5 = {1, 1, 1};
int[] www1 = {200, 100, 400, 100, 200};
int[] www2 = {60, 40, 30, 345, 50, 345, 30, 40, 60};
int[] www3 = {130, 235, 40, 50, 90, 50, 40, 235, 130};
int[] www4 = {225, 225, 100, 225, 225};
int[] www5 = {480, 40, 480};
int[] hhh1 = {0, 30, 0, 30, 0};
int[] hhh2 = {0, 30, 200, 40, 140, 40, 200, 30, 0};
int[] hhh3 = {40, 40, 200, 30, 40, 30, 200, 40, 40};
int[] hhh4 = {40, 40, 120, 40, 40};
int[] hhh5 = {40, 200, 40};
int[] yyy1 = {340, 340, 340, 340, 340};
int[] yyy2 = {100, 250, 100, 100, 0, 100, 100, 250, 100};
int[] yyy3 = {400, 400, 240, 340, 400, 340, 240, 400, 400};
int[] yyy4 = {560, 560, 480, 560, 560};
int[] yyy5 = {760, 600, 760};

int[] xxx = {100, 900, 375, 600, 60, 940};
int[] yyy = {690, 690, 195, 195, 360, 360};
int[] ttt = {2, 1, 1, 2, 2, 1};

// END LEVEL 3


PVector gravity = new PVector(0, 0.30);

void setup() {
  size(1000, 800);
  //pixelDensity(2);
  smooth();
  //frameRate(2);

  //platforms.add(new Platform(30, 650, 0, 1, 200, 50));
  //platforms.add(new Platform(250, 650, 0, 1, 200, 50));
  levelId = 1;

  menu = new Menu(50, 50, width/2-250, height/2-50, 100, 100);

  //platforms.add(new Platform(470, 650, 0, 1, 200, 50));
  //liquids.add(new Liquid(200, 500, 200, 50, 1));


  //gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
  //genD.generateDiamonds(x, y, t, 3);
  firstInit = true;

  platformImg = loadImage("platform.png");
  diamondred = loadImage("diamantred.png");
  diamondblue = loadImage("diamantblue.png");
}

void draw() {
  println(mouseX, mouseY);
  if (!menu.ready) {
    menu.display();
    menu.knap();
  }

  if (levelDrawn == false && menu.ready) {
    levelId = menu.levelId;

    println("Fetched lvl ID: "+menu.levelId);
    drawLevel(levelId);
    levelDrawn = true;

    println("drawing");

    if (menu.offline && firstInit) {
      println("player as server");
      s = new Server(this, 12345);  // Start a simple server on a port
    }

    if (menu.online && firstInit) {
      c = new Client(this, "172.20.10.4", 12345); // Replace with your server’s IP and port
    }
  }

  if (levelDrawn == true) {

    background(255);

    //println(player1.point);
    //println(player2.point);

    for (int i = 0; i < buttons.size(); i++) {
      Button b = buttons.get(i);

      b.display();
    }
    if (buttons.size() > 0) {
      if (!buttons.get(0).down) {
        buttons.get(1).checkStep();
      }

      if (!buttons.get(1).down) {
        buttons.get(0).checkStep();
      }
      if (buttons.size() > 2) {
        if (!buttons.get(2).down) {
          buttons.get(3).checkStep();
        }

        if (!buttons.get(3).down) {
          buttons.get(2).checkStep();
        }
      }
    }
    for (int i = 0; i < maal.size(); i++) {
      Maal m = maal.get(i);

      m.display();
      m.collision(player1);
      m.collision(player2);

      if (maal.get(0).sejr1 && maal.get(1).sejr2) {
        println("win");
        handleWin();
      }
    }
    for (int i = 0; i < drips.size(); i++) {
      Drip d = drips.get(i);

      d.display();
      d.update();
      d.collision(player1);
      d.collision(player2);
    }
    for (int i = 0; i < liquids.size(); i++) {
      Liquid l = liquids.get(i);

      l.display();
      l.collision(player1);
      l.collision(player2);
    }

    for (int i = 0; i < platforms.size(); i++) {
      Platform p = platforms.get(i);

      platforms.get(i).display();
      platforms.get(i).collision(player1, i);
      platforms.get(i).collision(player2, i);
    }
    for (int i = 0; i < diamonds.size(); i++) {
      Diamond d = diamonds.get(i);

      d.display();
      d.collision(player1);
      d.collision(player2);
      //d.pointCollect(player1);
      //d.pointCollect(player2);
    }

    player1.applyForce(gravity);
    player1.update();
    player1.display();
    player1.checkEdges();
    player2.applyForce(gravity);
    player2.update();
    player2.display();
    player2.checkEdges();
    timer();

    if (player1.isAlive == false || player2.isAlive == false) {
      player1.revive();
      player2.revive();
      for (int i = 0; i < diamonds.size(); i++) {
        Diamond d = diamonds.get(i);
        d.reset();
      }
    }

    sendNetworkData();
    recieveNetworkData();
  }
}

void keyPressed() {
  if (key == 'n') {
    levelId = 2;
    clearLevel();
  }

  if (key == 'm') {
    gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
    println("gen");
  }
  handlePress(keyCode, true);
}

void keyReleased() {
  handlePress(keyCode, false);
}

void handlePress(int k, boolean b) {
  switch (k) {
  case +'W':
    player1.isJumping = b;
    break;
  case +'S':
    player1.isDucking = b;
    break;
  case +'A':
    player1.isLeft = b;
    break;
  case +'D':
    player1.isRight = b;
    break;
  case +'I':
    player2.isJumping = b;
    break;
  case +'K':
    player2.isDucking = b;
    break;
  case +'J':
    player2.isLeft = b;
    break;
  case +'L':
    player2.isRight = b;
    break;
  }
}

void recieveNetworkData() {
  Player p1 = player1;
  Player p2 = player2;

  if (menu.offline) {

    c = s.available();
    if (c != null) {
      input = c.readString();
      input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
      data = float(split(input, ' '));  // Split values into an array
      // Draw line using received coords
      stroke(0);

      println("RECIEVE: "+input);

      if (data != null) {
        if (abs(data[0] - p2.location.x) < 50) {
          p2.location.x = data[0];
          p2.location.y = data[1];
        }
      }
    }
  } else {
    if (c.available() > 0) {
      input = c.readString();
      input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
      data = float(split(input, ' '));  // Split values into an array
      // Draw line using received coords

      println("RECIEVE: "+data[0]+","+data[1]);
      if (data != null) {
        if (abs(data[0] - p1.location.x) < 50) {
          p1.location.x = data[0];
          p1.location.y = data[1];
        }
      }
    }
  }
}

void sendNetworkData() {
  Player p1 = player1;
  Player p2 = player2;

  if (menu.offline) {
    s.write(p1.location.x + " " + p1.location.y + "\n");
  } else {
    c.write(p2.location.x + " " + p2.location.y + "\n");
  }
}

void timer() {
  int m = millis();
  fill(159, 11, 10);
  textSize(50);
  text(m/1000, 40, 40);
}

void drawLevel(int lvl) {
  switch(lvl) {
  case 1:
    buttons.add(new Button(650, 400, 8));
    buttons.add(new Button(780, 260, 8));
    maal.add(new Maal(600, 700, 50, 50, 1));
    maal.add(new Maal(500, 700, 50, 50, 2));
    drips.add(new Drip(100, 320, 20, 1, 550));
    //gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
    gen.loadFile("level1.txt");
    println("level 1!");
    genD.generateDiamonds(x, y, t, 6);

    break;
  case 2:
    buttons.add(new Button(180, 520, 14));
    buttons.add(new Button(780, 520, 14));
    buttons.add(new Button(250, 90, 1));
    buttons.add(new Button(700, 90, 1));
    maal.add(new Maal(100, 50, 50, 50, 1));
    maal.add(new Maal(180, 50, 50, 50, 2));
    drips.add(new Drip(90, 150, 20, 1, 460));
    //gen2.generateLevel(ee1, ee2, ee3, ee4, ee5, ww1, ww2, ww3, ww4, ww5, hh1, hh2, hh3, hh4, hh5, yy1, yy2, yy3, yy4, yy5);
    gen2.loadFile("level2.txt");
    println("level 2!");
    genD2.generateDiamonds(xx, yy, tt, 6);
    break;
  case 3:
    buttons.add(new Button(650, 740, 15));
    buttons.add(new Button(650, 540, 15));
    buttons.add(new Button(300, 740, 19));
    buttons.add(new Button(300, 540, 19));
    maal.add(new Maal(400, 25, 50, 50, 2));
    maal.add(new Maal(550, 25, 50, 50, 1));
    drips.add(new Drip(200, 0, 20, 1, 100));
    drips.add(new Drip(800, 0, 20, 2, 100));
    //gen3.generateLevel(eee1, eee2, eee3, eee4, eee5, www1, www2, www3, www4, www5, hhh1, hhh2, hhh3, hhh4, hhh5, yyy1, yyy2, yyy3, yyy4, yyy5);
    gen3.loadFile("level3.txt");
    println("level 3!");
    genD3.generateDiamonds(xxx, yyy, ttt, 6);

    player1.location.set(440, 680);
    player2.location.set(530, 500);
    break;
  }

  levelDrawn = true;
}

void handleWin() {
  menu.ready = false;
  menu.lvl1c = false;
  menu.lvl2c = false;
  menu.lvl3c = false;
  menu.rc = false;
  menu.levelId = 1;

  levelDrawn = false;

  if (s != null) {
    s.stop();
  } else {
  c.stop();
  }

  platforms.clear();
  liquids.clear();
  buttons.clear();
  maal.clear();
  drips.clear();
  diamonds.clear();

  player1.revive();
  player2.revive();

  gen.x1 = 0;
  gen.x2 = 0;
  gen.x3 = 0;
  gen.x4 = 0;
  gen.x5 = 0;
  gen2.x1 = 0;
  gen2.x2 = 0;
  gen2.x3 = 0;
  gen2.x4 = 0;
  gen2.x5 = 0;
  gen3.x1 = 0;
  gen3.x2 = 0;
  gen3.x3 = 0;
  gen3.x4 = 0;
  gen3.x5 = 0;

  background(255);

  println("handling win!");
}

void clearLevel() {
  levelDrawn = false;

  platforms.clear();
  liquids.clear();
  buttons.clear();
  maal.clear();

  background(255);
  drawLevel(levelId);
}
