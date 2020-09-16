class Platform {
  PVector location;
  float xpos, ypos, xmove, yposdef, maxdown;
  float sizex, sizey;
  float period;
  float amplitude;
  boolean booster, down;
  float timeToBoost, isBox;

  int player;

  Platform(float x, float y, float a, float p, float sx, float sy, boolean boost) {
    amplitude = a;
    period = p;
    xpos = x;
    ypos = y;
    yposdef = y;
    sizex = sx;
    sizey = sy;
    booster = boost;
    down = false;
    maxdown = ypos+121;
  }

  void down() {
    if (ypos < maxdown) {
      ypos++;
      //println("down");
    }
  }
  
  void up() {
    if (ypos > yposdef) {
      ypos--;
    }
  }

  void display() {
    xmove = amplitude * cos(TWO_PI * frameCount/period);
    noStroke();
    fill(139, 69, 19);
    rect(xpos+xmove, ypos, sizex, sizey);

    if (booster) {
      fill(255, 223, 0);
      arc(xpos+sizex/2, ypos+sizey/2, 15, 15, 0, 2*PI-timeToBoost, PIE);
    }

    if (timeToBoost > 0) timeToBoost = timeToBoost - 0.02;

    //println(timeToBoost);
  }

  void collision(Player p, int i) {
    // println("Checking on platform: "+i);
    // is on the platform!

    // fra siden (venstre)

    if (p.location.y+p.h > ypos+8 && p.location.y < ypos+sizey && p.location.x+p.w > xpos+xmove && p.location.x+p.w+xmove < xpos+10+xmove) {
      p.location.x = xpos-p.w+xmove;
    }
    // fra siden (højre)
    if (p.location.y+p.h > ypos+8 && p.location.y < ypos+sizey && p.location.x < xpos+sizex+xmove && p.location.x+xmove > xpos+sizex-10+xmove) {
      p.location.x = xpos+sizex+xmove;
    }
    //oppe fra og ned
    if (p.location.y+p.h > ypos && p.location.y <= ypos+8 && p.location.x+p.w > xmove+xpos && p.location.x < xpos+sizex+xmove && p.location.y+p.h < ypos+8) {
      p.location.y = ypos-60;
      p.isOnPlatform = true;
      p.isMidAir = false;
      p.velocity.set(0, 0);

      if (booster && timeToBoost < 0.01) {
          p.hasBoost = true;
        timeToBoost = 2*PI;
      }
    }

    // headbutt
    if (p.location.y < ypos+sizey && p.location.y > ypos && p.location.x+30 > xpos+xmove && p.location.x < xpos+sizex+xmove) {
      p.location.y = ypos+sizey;
      p.velocity.y = p.velocity.y*-1;
    }
  }
}
