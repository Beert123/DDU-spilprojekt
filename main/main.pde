ArrayList<Platform> platforms = new ArrayList<Platform>();
Player player1 = new Player(50, 650, 1, 30, 60);

PVector gravity = new PVector(0, 0.3);

void setup() {
  size(1000, 800);
  pixelDensity(2);
  smooth();
  
  platforms.add(new Platform(300, 600, 0, 1, 200, 50));
}

void draw() {
  background(255);
  player1.applyForce(gravity);
  player1.update();
  player1.display();
  
  for (int i = 0; i < platforms.size(); i++) {
    Platform p = platforms.get(i);
    
    p.display();
    p.collision(player1);
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
  }
}
