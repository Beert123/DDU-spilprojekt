class Platform {
  PVector location;
  float xpos, ypos, ymove;
  float sizex, sizey;
  float period;
  float amplitude;
  boolean booster;
  float timeToBoost, isBox;

  int player;

  Platform(float x, float y, float a, float p, float sx, float sy, boolean boost) {
    amplitude = a;
    period = p;
    xpos = x;
    ypos = y;
    sizex = sx;
    sizey = sy;
    booster = boost;
}

  void display() {
    ymove = amplitude * cos(TWO_PI * frameCount/period);
    stroke(0);
    fill(139, 69, 19);
    rect(xpos, ypos+ymove, sizex, sizey);

    if (booster) {
      fill(255, 223, 0);
      arc(xpos+sizex/2, ypos+sizey/2, 15, 15, 0, 2*PI-timeToBoost, PIE);
    }
    
    if (timeToBoost > 0) timeToBoost = timeToBoost - 0.02;
    println(timeToBoost);
  }

  void collision(Player p, int i) {
    // println("Checking on platform: "+i);
    // is on the platform!
// fra siden
    if (p.location.y+p.h > ypos+8 && p.location.y < ypos+sizey && p.location.x+p.w > xpos && p.location.x+p.w < xpos+10) {
      p.location.x = xpos-p.w;
    }
// fra siden
    if (p.location.y+p.h > ypos+8 && p.location.y < ypos+sizey && p.location.x < xpos+sizex && p.location.x > xpos+sizex-10) {
      p.location.x = xpos+sizex;
    }
//oppe fra og ned
    if (p.location.y+p.h > ypos && p.location.y <= ypos+8 && p.location.x+p.w > xpos && p.location.x < xpos+sizex && p.location.y+p.h < ypos+8) {
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
    if (p.location.y < ypos+sizey && p.location.y > ypos && p.location.x+30 > xpos && p.location.x < xpos+sizex) {
      p.velocity.y = p.velocity.y*-1;
    }
  }
}
