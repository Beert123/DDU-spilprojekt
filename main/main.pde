import processing.net.*;
int level;
Server s; 
Client c;
String input;
float data[];

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
Menu menu;

boolean server = true;
boolean levelDrawn, ready;
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

int[] x = {200, 300, 400};
int[] y = {650, 650, 650};
int[] t = {1, 2, 1};

//END LEVEL 1

// LEVEL 2

int[] ee1 = {0, 0, 0, 0};
int[] ee2 = {5, 1, 1, 1, 1, 1};
int[] ee3 = {0, 1, 1, 1, 1, 0};
int[] ee4 = {5, 1, 1, 1, 4, 1};
int[] ee5 = {1, 1, 1, 1, 3, 1, 2, 1, 5};
int[] ww1 = {200, 50, 150, 600};
int[] ww2 = {100, 400, 200, 50, 150, 100};
int[] ww3 = {200, 200, 50, 300, 150, 100};
int[] ww4 = {150, 150, 50, 150, 150, 150};
int[] ww5 = {220, -220, 220, 130, 100, 200, 100, 100, 150};
int[] hh1 = {40, 60, 100, 40};
int[] hh2 = {120, 40, 80, 100, 60, 40};
int[] hh3 = {40, 40, 60, 40, 80, 40};
int[] hh4 = {40, 40, 90, 40, 40, 40};
int[] hh5 = {40, 20, 20, 40, 40, 40, 40, 40, 100};
int[] yy1 = {110, 90, 110, 110};
int[] yy2 = {200, 280, 240, 240, 280, 300};
int[] yy3 = {400, 400, 400, 420, 420, 460};
int[] yy4 = {550, 550, 550, 600, 600, 600};
int[] yy5 = {760, 670, 670, 760, 760, 760, 760, 760, 700};

// END LEVEL 2

// LEVEL 3

int[] eee1 = {0, 0, 0, 0};
int[] eee2 = {5, 0, 0, 0, 0, 0};
int[] eee3 = {0, 1, 1, 1, 1, 0};
int[] eee4 = {5, 1, 1, 1, 4, 1};
int[] eee5 = {1, 1, 1, 1, 3, 1, 2, 1, 5};
int[] www1 = {200, 50, 150, 600};
int[] www2 = {100, 400, 200, 50, 150, 100};
int[] www3 = {200, 200, 50, 300, 150, 100};
int[] www4 = {150, 150, 50, 150, 150, 150};
int[] www5 = {220, -220, 220, 130, 100, 200, 100, 100, 150};
int[] hhh1 = {40, 60, 100, 40};
int[] hhh2 = {120, 40, 80, 100, 60, 40};
int[] hhh3 = {40, 40, 60, 40, 80, 40};
int[] hhh4 = {40, 40, 90, 40, 40, 40};
int[] hhh5 = {40, 20, 20, 40, 40, 40, 40, 40, 100};
int[] yyy1 = {110, 90, 110, 110};
int[] yyy2 = {200, 280, 240, 240, 280, 300};
int[] yyy3 = {400, 400, 400, 420, 420, 460};
int[] yyy4 = {550, 550, 550, 600, 600, 600};
int[] yyy5 = {760, 670, 670, 760, 760, 760, 760, 760, 700};

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

  maal.add(new Maal(850, 50, 50, 50, 1));
  maal.add(new Maal(780, 50, 50, 50, 2));

  menu = new Menu(50, 50, width/2-250, height/2-50, 100, 100);

  drips.add(new Drip(100, 320, 20, 1, 550));

  buttons.add(new Button(650, 400, 8));
  buttons.add(new Button(780, 260, 8));
  //platforms.add(new Platform(470, 650, 0, 1, 200, 50));
  //liquids.add(new Liquid(200, 500, 200, 50, 1));


  //gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
  genD.generateDiamonds(x, y, t, 3);
  if (server) {
    s = new Server(this, 12345);  // Start a simple server on a port
  } else {
    c = new Client(this, "172.20.10.4", 12345); // Replace with your server’s IP and port
  }
}

void draw() {
  if (!menu.ready) {
    menu.display();
    menu.knap();
  }

  if (levelDrawn == false && menu.ready) {
    levelId = menu.levelId;
    
    if (menu.offline) {
      server = false;
    }
    
    println("Fetched lvl ID: "+menu.levelId);
    drawLevel(levelId);
    levelDrawn = true;

    println("drawing");
  }

  if (levelDrawn) {

    background(255);

    //println(player1.point);
    //println(player2.point);

    for (int i = 0; i < buttons.size(); i++) {
      Button b = buttons.get(i);

      b.display();
    }

    if (!buttons.get(0).down) {
      buttons.get(1).checkStep();
    }

    if (!buttons.get(1).down) {
      buttons.get(0).checkStep();
    }
    for (int i = 0; i < maal.size(); i++) {
      Maal m = maal.get(i);

      m.display();
      m.collision(player1);
      m.collision(player2);

      if (maal.get(0).sejr1 && maal.get(1).sejr2) {
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
    for (int i = 0; i < diamonds.size(); i++) {
      Diamond d = diamonds.get(i);

      d.display();
      d.collision(player1);
      d.collision(player2);
      //d.pointCollect(player1);
      //d.pointCollect(player2);
    }

    for (int i = 0; i < platforms.size(); i++) {
      Platform p = platforms.get(i);

      platforms.get(i).display();
      platforms.get(i).collision(player1, i);
      platforms.get(i).collision(player2, i);
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

  if (server) {

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

  if (server) {
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
    gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
    println("level 1!");
    break;
  case 2:
    gen2.generateLevel(ee1, ee2, ee3, ee4, ee5, ww1, ww2, ww3, ww4, ww5, hh1, hh2, hh3, hh4, hh5, yy1, yy2, yy3, yy4, yy5);
    println("level 2!");
    break;
  case 3:
    gen3.generateLevel(eee1, eee2, eee3, eee4, eee5, www1, www2, www3, www4, www5, hhh1, hhh2, hhh3, hhh4, hhh5, yyy1, yyy2, yyy3, yyy4, yyy5);
    println("level 3!");
    break;
  }

  levelDrawn = true;
}

void handleWin() {
}

void clearLevel() {
  levelDrawn = false;

  platforms.clear();
  liquids.clear();

  drawLevel(levelId);
}
