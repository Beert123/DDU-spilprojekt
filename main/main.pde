ArrayList<Platform> platforms = new ArrayList<Platform>();
Player player1 = new Player(400, 500, 1, 30, 60);

PVector gravity = new PVector(0, 0.3);

void setup() {
  size(1000, 800);
  pixelDensity(2);
  smooth();

  //platforms.add(new Platform(30, 650, 0, 1, 200, 50));
  //platforms.add(new Platform(250, 650, 0, 1, 200, 50));
  platforms.add(new Platform(470, 500, 0, 1, 200, 50));
}

void draw() {
  println(player1.velocity.y);
  background(255);
  for (int i = 0; i < platforms.size(); i++) {
    Platform p = platforms.get(i);

    platforms.get(i).display();
    platforms.get(i).collision(player1, i);
  }
  player1.applyForce(gravity);
  player1.update();
  player1.display();
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
