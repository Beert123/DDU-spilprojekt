class Player {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector realLocation;
  int type, h, w; // 1 is water, 2 is fire
  boolean isRight, isLeft, isJumping, isDucking, isMidAir, isOnPlatform;

  float groundY;

  color playerColor;

  Player(float x, float y, int t, int bredde, int hoejde) {
    type = t;
    location = new PVector(x, y);
    realLocation = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    isRight = false;
    isLeft = false;
    isMidAir = false;
    isJumping = false;
    isOnPlatform = true;

    h = hoejde;
    w = bredde;

    groundY = 650;

    if (type == 1) {
      playerColor = color(0, 0, 255);
    } else if (type == 2) {
      playerColor = color(255, 0, 0);
    }
  }

  void display() {
    fill(playerColor);
    stroke(0);
    rect(location.x, location.y, w, h);

    if (isLeft) moveLeft();
    if (isRight) moveRight();
    if (isJumping) jump();
  }

  void moveLeft() {
    if (location.x >= 50) {
      location.add(-8, 0);
    }
  }

  void moveRight() {
    if (location.y <= width-50) {
      location.add(8, 0);
    }
  }

  void jump() {
    if (!isMidAir || isOnPlatform) {
      println("Start: "+groundY);
      velocity.set(0, -12);
      isJumping = false;
      isMidAir = true;
      isOnPlatform = false;
      println("Jumped!");
    }
  }

  void applyForce(PVector f) {
    if (isMidAir) {
      acceleration.add(f);
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

    if (location.y > groundY) {
      isMidAir = false;
      location.y = groundY;
      velocity.set(0, 0);
    }
    
    if (location.y < groundY) {
      isMidAir = true;
    }

  }
}
