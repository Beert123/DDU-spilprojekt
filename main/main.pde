ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Maal> maal = new ArrayList<Maal>();
ArrayList<Liquid> liquids = new ArrayList<Liquid>();
ArrayList<Diamond> diamonds = new ArrayList<Diamond>();
Player player1 = new Player(100, 500, 1, 30, 60);
Player player2 = new Player(100, 500, 2, 30, 60);
LevelGenerator gen = new LevelGenerator(1);

//LEVEL 1
int[] e1 = {0, 1, 1, 1};
int[] e2 = {5, 1, 1, 1, 1};
int[] e3 = {0, 1, 1, 1, 1, 5};
int[] e4 = {5, 1, 1, 1, 4, 1};
int[] e5 = {1, 3, 1, 2, 1, 5};
int[] w1 = {200, 50, 150, 600};
int[] w2 = {100, 400, 200, 50, 150};
int[] w3 = {200, 200, 50, 300, 125, 125};
int[] w4 = {150, 150, 50, 150, 150, 150};
int[] w5 = {350, 100, 200, 100, 100, 150};
int[] h1 = {40, 60, 100, 40};
int[] h2 = {120, 40, 80, 100, 60};
int[] h3 = {40, 40, 60, 40, 80, 80};
int[] h4 = {40, 40, 90, 40, 40, 40};
int[] h5 = {40, 40, 40, 40, 40, 100};
int[] y1 = {110, 90, 110, 110};
int[] y2 = {200, 280, 240, 240, 280};
int[] y3 = {400, 400, 400, 420, 420, 420};
int[] y4 = {550, 550, 550, 600, 600, 600};
int[] y5 = {760, 760, 760, 760, 760, 700};
//END LEVEL 1

PVector gravity = new PVector(0, 0.30);

void setup() {
  size(1000, 800);
  //pixelDensity(2);
  smooth();

  //platforms.add(new Platform(30, 650, 0, 1, 200, 50));
  //platforms.add(new Platform(250, 650, 0, 1, 200, 50));

  //maal.add(new Maal(100,500,50,50));
  //platforms.add(new Platform(470, 650, 0, 1, 200, 50));
  //liquids.add(new Liquid(200, 500, 200, 50, 1));
  diamonds.add(new Diamond(250, 600, 20, 20 ,1));
  
  gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
}


void draw() {
  background(255);

  for (int i = 0; i < liquids.size(); i++){
    Liquid l = liquids.get(i);
    
    l.display();
    l.collision(player1);
    l.collision(player2);
  }
  for (int i = 0; i < diamonds.size(); i++){
    Diamond d = diamonds.get(i);
    
    d.display();
    d.collision(player1);
    d.collision(player2);
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
  
  if(player1.isAlive == false || player2.isAlive == false) {
  player1.revive();
  player2.revive();
  }
}

void keyPressed() {
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

void timer(){
    int m = millis();
    fill(159, 11 ,10);
    textSize(50);
    text(m/1000,40,40);
  }
