ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Maal> maal = new ArrayList<Maal>();
ArrayList<Liquid> liquids = new ArrayList<Liquid>();
Player player1 = new Player(100, 500, 1, 30, 60);
Player player2 = new Player(100, 500, 2, 30, 60);
LevelGenerator gen = new LevelGenerator(1);

//LEVEL 1
int[] e1 = {1, 0, 1, 3, 1};
int[] e2 = {1, 0, 1};
int[] e3 = {1, 1, 3, 4, 6};
int[] w1 = {400, 200, 100, 100, 200};
int[] w2 = {200, 200, 600};
int[] w3 = {400, 50, 100, 100, 400};
//END LEVEL 1

PVector gravity = new PVector(0, 0.25);

void setup() {
  size(1000, 800);
  //pixelDensity(2);
  smooth();

  //platforms.add(new Platform(30, 650, 0, 1, 200, 50));
  //platforms.add(new Platform(250, 650, 0, 1, 200, 50));

//  maal.add(new Maal(200,550,50,50));
  //platforms.add(new Platform(470, 650, 0, 1, 200, 50));
  //liquids.add(new Liquid(200, 500, 200, 50, 1));
  
  gen.generateLevel(e1, e2, e3, w1, w2, w3);
  }


void draw() {
  background(255);

  for (int m = 0; m <maal.size(); m++){
    Maal n = maal.get(m);
    n.display();
    n.collision(player1);
    n.collision(player2); 
  }
  for (int i = 0; i < liquids.size(); i++){
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
