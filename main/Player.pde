class Player {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector realLocation;
  int type, point, h, w; // 1 is water, 2 is fire

  boolean isRight, isLeft, isJumping, isDucking, isMidAir, isOnPlatform, isAlive, hasBoost, inLiquid;

  float groundY, x, y;

  color playerColor;

  Player(float x_, float y_, int t, int bredde, int hoejde) {
    x = x_;
    y = y_;
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
    inLiquid = false;

    h = hoejde;
    w = bredde;

    point = 0;
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
        //fill(255, 223, 0);
        //ellipse(location.x+40, location.y+20, 15, 15);
        image(boostImg, location.x+30, location.y+20-15, 20, 30);
        fill(playerColor);
      }

      if (isLeft) moveLeft();
      if (isRight) moveRight();
      if (isJumping) jump();
    }
  }

  void moveLeft() {
    if (location.x >= 2) {
      if (inLiquid) {
        location.add(-2, 0);
      } else {
        location.add(-4, 0);
      }
    }
  }

  void moveRight() {
    if (location.x <= width - 10) {
      if (inLiquid) {
        location.add(2, 0);
      } else {
        location.add(4, 0);
      }
    }
  }

  void jump() {
    if (velocity.y == 0 && isOnPlatform) {
      //println("Start: "+groundY);
      location.y = location.y-1;
      if (hasBoost) {
        velocity.set(0, -10);
      } else {
        velocity.set(0, -7  );
      }
      isJumping = false;
      hasBoost = false;
      isMidAir = true;
      isOnPlatform = false;
      inLiquid = false;
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
    point = 0;
    inLiquid = false;
    isAlive = true;
    if (menu.levelId == 1) {
      location.set(x, y);
    }
    if (menu.levelId == 2) {
      location.set(x, y);
    }
    if (menu.levelId == 3) {
      if (type == 1) {
        location.set(440, 680);
      }
      if (type == 2) {
        location.set(530, 500);
      }
    }
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
