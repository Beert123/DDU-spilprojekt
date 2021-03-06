class Diamond {
  float x, y, w, h, state;

  boolean isCollected;
  
  PImage theDiamond;

  Diamond(float x_, float y_, float w_, float h_, float s) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    state = s;
    isCollected = false;
  }
  void display() {
    if (state == 1) {
      if (isCollected == false) {
        stroke(0);
        //fill(0, 0, 255);
        //rect(x, y, w, h);
        image(diamondblue, x-15, y-15, w+30, h+30);
      }
    }
    if (state == 2) {
      if (isCollected == false) {
        stroke(0);
        //fill(255, 0, 0);
        //rect(x, y, w, h);
        image(diamondred, x-12.5, y-12.5, w+25, h+25);
      }
    }
  }
  void collision(Player p) {
    if (state == 1 && p == player1) {
      // fra siden
      if (!isCollected && p.location.y+p.h > y+8 && p.location.y < y+h && p.location.x+p.w > x && p.location.x+p.w < x+10) {
        p.point++;
        isCollected = true;
      }
      // fra siden
      if (!isCollected && p.location.y+p.h > y+8 && p.location.y < y+h && p.location.x < x+w && p.location.x > x+w-10) {
        p.point++;
        isCollected = true;
      }
      //oppe fra og ned
      if (!isCollected && p.location.y+p.h > y && p.location.y <= y+8 && p.location.x+p.w > x && p.location.x < x+w && p.location.y+p.h < y+8) {
        p.point++;
        isCollected = true;
      }
      // headbutt
      if (!isCollected && p.location.y < y+h && p.location.y > y && p.location.x+30 > x && p.location.x < x+w) {
        p.point++;
        isCollected = true;
      }
    }
    if (state == 2 && p == player2) {
      // fra siden
      if (!isCollected && p.location.y+p.h > y+8 && p.location.y < y+h && p.location.x+p.w > x && p.location.x+p.w < x+10) {
        p.point++;
        isCollected = true;
      }
      // fra siden
      if (!isCollected && p.location.y+p.h > y+8 && p.location.y < y+h && p.location.x < x+w && p.location.x > x+w-10) {
        p.point++;
        isCollected = true;
      }
      //oppe fra og ned
      if (!isCollected && p.location.y+p.h > y && p.location.y <= y+8 && p.location.x+p.w > x && p.location.x < x+w && p.location.y+p.h < y+8) {
        p.point++;
        isCollected = true;
      }
      // headbutt
      if (!isCollected && p.location.y < y+h && p.location.y > y && p.location.x+30 > x && p.location.x < x+w) {
        p.point++;
        isCollected = true;
      }
    }
  }
  void reset(){
    
    isCollected = false;
  }
  /*void pointCollect(Player p) {
    if (isCollected == true && p == player1) {
      p.point++;
    }
    if (isCollected == true && p == player2) {
      p.point++;
    }
  }*/
}
