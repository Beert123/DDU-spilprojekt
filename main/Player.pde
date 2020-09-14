class Player {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector realLocation;
  int type, h, w; // 1 is water, 2 is fire
  boolean isRight, isLeft, isJumping, isDucking, isMidAir, isOnPlatform, isAlive, hasBoost;

  float groundY;

  color playerColor;

  Player(float x, float y, int t, int bredde, int hoejde) {
    type = t;
    location = new PVector(x, y);
    realLocation = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    isAlive = true;
    isRight = false;
    isLeft = false;
    isMidAir = false;
    isJumping = false;
    isOnPlatform = true;

    h = hoejde;
    w = bredde;

    groundY = 760;

    if (type == 1) {
      playerColor = color(0, 0, 255);
    } else if (type == 2) {
      playerColor = color(255, 0, 0);
    }
  }

  void display() {
    if (isAlive) {
      fill(playerColor);
      stroke(0);
      rect(location.x, location.y, w, h);
      
      if (hasBoost) {
        fill(255, 223, 0);
        ellipse(location.x+40, location.y+20, 15, 15);
        fill(playerColor);
      }

      if (isLeft) moveLeft();
      if (isRight) moveRight();
      if (isJumping) jump();
    }
  }

  void moveLeft() {
    if (location.x >= 2) {
      location.add(-4, 0);
    }
  }

  void moveRight() {
    if (location.x <= width - 10) {
      location.add(4, 0);
    }
  }

  void jump() {
    if (velocity.y == 0 && isOnPlatform) {
      println("Start: "+groundY);
      location.y = location.y-1;
      if (hasBoost) {
        velocity.set(0, -10);
      } else {
        velocity.set(0, -7);
      }
      isJumping = false;
      hasBoost = false;
      isMidAir = true;
      isOnPlatform = false;
      //println("Jumped!");
    }
  }

  void applyForce(PVector f) {
    if (!isOnPlatform || isMidAir) {
      acceleration.add(f);
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

    if (velocity.y > 6) {
      velocity.y = 6;
    }

    if (location.y > groundY) {
      isMidAir = false;
      location.y = groundY;
      velocity.set(0, 0);
    }

    if (location.y < groundY) {
      isMidAir = true;
    }
  }

  void kill() {
    isAlive = false;
  }

  void revive() {
    
    location.set(100,650);
    isAlive = true;
  }

  void checkEdges() {
    if (location.y > 800) {
      location.y = 800;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
}
