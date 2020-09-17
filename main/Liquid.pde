class Liquid {
  float x, y, w, h;
  float yg, hl, hg;
  int state;
  int p;

  Liquid(float x_, float y_, float w_, float h_, int s) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    state = s;

    hl = h * 3/4;
    yg = y + h * 3/4; 
    hg = h/4-1;
  }

  void display() {
    if (state == 1) {
      noStroke();
      fill(0, 0, 255);
  //    rect(x, y, w, hl);
      image(platformBlue,x,y,w,hl);
      stroke(0);
      fill(0);
      rect(x, yg, w, hg);
    }
    if (state == 2) {
      noStroke();
      fill(255, 0, 0);
    //  rect(x, y, w, hl);
    image(platformRed,x, y, w, hl);
     stroke(0);
     fill(0);
     rect(x, yg, w, hg);
     
    }
    if (state == 3) {
      noStroke();
      fill(0, 255, 0);
  //    rect(x, y, w, hl);
      image(platformGreen,x,y,w,hl);
      stroke(0);
      fill(0);
      rect(x, yg, w, hg);
    }
  }
  void collision(Player p) {
    if (p.location.x> x && p.location.x< x+w && p.location.y> y && p.location.y<y+hl)
    {
      //println("YEEAAHH1");
      if (state == 1 && p.type == 2) {
        p.kill();
      }
      if (state == 2 && p.type == 1) {
        p.kill();
      }
      if (state == 3) {
        p.kill();
      }
    }
    if (p.location.x> x && p.location.x< x+w && p.location.y+p.h> y+10 && p.location.y+p.h<y+hl) {
      //println("YEEAAHH2");
      println(p.inLiquid);
      if (state == 1 && p.type == 2) {
        p.kill();
      }
      if (state == 2 && p.type == 1) {
        p.kill();
      }
      if (state == 3) {
        p.kill();
      }
    }
    if (p.location.y+p.h > yg && p.location.y <= yg+8 && p.location.x+p.w > x && p.location.x < x+w && p.location.y+p.h < yg+8) {
      p.location.y = yg-60;
      p.isOnPlatform = true;
      p.inLiquid = true;
      p.isMidAir = false;
      p.velocity.set(0, 0);
    }
    if (p.location.y < yg+hg && p.location.y > yg && p.location.x+30 > x && p.location.x < x+w) {
      p.velocity.y = p.velocity.y*-0.7;
    }
  }
}
