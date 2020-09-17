class Maal {
  PVector location = new PVector(); 
  PVector bigness= new PVector();
  boolean sejr1 = false;
  int state;
  boolean sejr2 = false;

  Maal(float x, float y, float bigX, float bigY, int s) {
    location.x = x;
    location.y =y;
    bigness.x = bigX;
    bigness.y = bigY;
    state = s;
  }
  void display() {
    if (state == 1) {
      image(doorblue, location.x, location.y, bigness.x, bigness.y);
      fill(0, 50, 255);
    } else {
      image(doorred, location.x, location.y, bigness.x, bigness.y);
      fill(255, 50, 0);
    }

    //rect(location.x, location.y, bigness.x, bigness.y);

    if (sejr1) {
      println("ayoo");
    }

    if (sejr2) {
      println("aaayoo");
    }
  }

  void collision(Player p) {
    // fra siden
    if (state == 1 && p == player1) {
      if (p.location.y+p.h > location.y+8 && p.location.y < location.y+bigness.y && p.location.x+p.w > location.x && p.location.x+p.w < location.x+10) {
        wait = false;
        if (millis() - lastTime > 1500) {
          sejr1 = true;
        } else {
          sejr1 = false;
        }
      }
      // fra siden
      if (p.location.y+p.h > location.y+8 && p.location.y < location.y+bigness.y && p.location.x < location.x+bigness.x && p.location.x > location.x+bigness.x-10) {
        wait = false;
        if (millis() - lastTime > 1500) {
          sejr1 = true;
        } else {
          sejr1 = false;
        }
      }
      //oppe fra og ned
      if (p.location.y+p.h > location.y && p.location.y <= location.y+8 && p.location.x+p.w > location.x && p.location.x < location.x+bigness.x && p.location.y+p.h < location.y+8) {
        wait = false;
        if (millis() - lastTime > 1500) {
          sejr1 = true;
        } else {
          sejr1 = false;
        }
      }
      //headbutt
      if (p.location.y < location.y+bigness.y && p.location.y > location.y && p.location.x+30 > location.x && p.location.x < location.x+bigness.x) {
        wait = false;
        if (millis() - lastTime > 1500) {
          sejr1 = true;
        } else {
          sejr1 = false;
        }
      }
    }


    if (state == 2 && p == player2) {
      if (p.location.y+p.h > location.y+8 && p.location.y < location.y+bigness.y && p.location.x+p.w > location.x && p.location.x+p.w < location.x+10) {
        wait2 = false;
        if (millis() - lastTime2 > 1500) {
          sejr2 = true;
        } else {
          sejr2 = false;
        }
      }
      // fra siden
      if (p.location.y+p.h > location.y+8 && p.location.y < location.y+bigness.y && p.location.x < location.x+bigness.x && p.location.x > location.x+bigness.x-10) {
        wait2 = false;
        if (millis() - lastTime2 > 1500) {
          sejr2 = true;
        } else {
          sejr2 = false;
        }
      }
      //oppe fra og ned
      if (p.location.y+p.h > location.y && p.location.y <= location.y+8 && p.location.x+p.w > location.x && p.location.x < location.x+bigness.x && p.location.y+p.h < location.y+8) {
        wait2 = false;
        if (millis() - lastTime2 > 1500) {
          sejr2 = true;
        } else {
          sejr2 = false;
        }
      }
      //headbutt
      if (p.location.y < location.y+bigness.y && p.location.y > location.y && p.location.x+30 > location.x && p.location.x < location.x+bigness.x) {
        wait2 = false;
        if (millis() - lastTime2 > 1500) {
          sejr2 = true;
        } else {
          sejr2 = false;
        }
      }
    }
  }
}
