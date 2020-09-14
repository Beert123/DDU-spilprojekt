class Platform {
  PVector location;
  float xpos, ypos, ymove;
  float sizex, sizey;
  float period;
  float amplitude;

  int player;

  Platform(float x, float y, float a, float p, float sx, float sy) {
    amplitude = a;
    period = p;
    xpos = x;
    ypos = y;
    sizex = sx;
    sizey = sy;
  }
  
  void display() {
    ymove = amplitude * cos(TWO_PI * frameCount/period);
    stroke(0);
    fill(139, 69, 19);
    rect(xpos, ypos+ymove, sizex, sizey);
  }
  
  void collision(Player p, int i) {
    // println("Checking on platform: "+i);
    // is on the platform!
    if (p.location.y+p.h > ypos+8 && p.location.y < ypos+sizey && p.location.x+p.w > xpos && p.location.x+p.w < xpos+10) {
      p.location.x = xpos-p.w;
    }

    if (p.location.y+p.h > ypos+8 && p.location.y < ypos+sizey && p.location.x < xpos+sizex && p.location.x > xpos+sizex-10) {
      p.location.x = xpos+sizex;
    }

    if (p.location.y+p.h > ypos && p.location.y <= ypos+8 && p.location.x+p.w > xpos && p.location.x < xpos+sizex && p.location.y+p.h < ypos+8) {
      p.location.y = ypos-60;
      p.isOnPlatform = true;
      p.isMidAir = false;
      p.velocity.set(0, 0);
    }

    // headbutt
    if (p.location.y < ypos+sizey && p.location.y > ypos && p.location.x+30 > xpos && p.location.x < xpos+sizex) {
      p.velocity.y = p.velocity.y*-1;
    }
  }
}
