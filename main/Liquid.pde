class Liquid {
  float x, y, w, h;
  float yg, hl, hg;
  int state;

  Liquid(float x_, float y_, float w_, float h_, int s) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    state = s;
    
    hl = h * 3/4;
    yg = y + h * 3/4; 
    hg = h/4;
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    rect(x, y, w, hl);
    fill(0);
    rect(x, yg, w, hg);
  }
  void collision(Player p) {
    if (p.location.x> x && p.location.x< x+w && p.location.y> y && p.location.y<y+hl)
    {
      println("YEEAAHH1");
    }
    if (p.location.x+p.h> x && p.location.x+p.h< x+w && p.location.y> y && p.location.y<y+hl) {
      println("YEEAAHH2");
    }
  }
}
