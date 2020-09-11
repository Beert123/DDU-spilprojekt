class Liquid {
  float x, y, w, h;
  int state;

  Liquid(float x_, float y_, float w_, float h_, int s) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    state = s;
  }

  void display() {
    noStroke();
    fill(0,0,255);
    rect(x, y, w, h);
  }
  void collision(Player p) {
    if (p.location.x> x && p.location.x< x+w && p.location.y> y && p.location.y<y+h)
    {
      println("YEEAAHH1");
      if (p.location.x+p.h> x && p.location.x+p.h< x+w && p.location.y> y && p.location.y<y+h) {
        println("YEEAAHH2");
      }
    }
  }
}
