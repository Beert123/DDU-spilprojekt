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
    stroke(0);
    fill(0);
    rect(x, yg, w, hg);
  }
  void collision(Player p) {
    if (p.location.x> x && p.location.x< x+w && p.location.y> y && p.location.y<y+hl)
    {
      println("YEEAAHH1");
      
    }
    if (p.location.x> x && p.location.x< x+w && p.location.y+p.h> y && p.location.y+p.h<y+hl) {
      println("YEEAAHH2");
      
    }
    if (p.location.y+p.h > yg && p.location.y <= yg+8 && p.location.x+p.w > x && p.location.x < x+w && p.location.y+p.h < yg+8) {
      p.location.y = yg-60;
      p.isOnPlatform = true;
      p.isMidAir = false;
      p.velocity.set(0, 0);
    }
    if (p.location.y < yg+hg && p.location.y > yg && p.location.x+30 > x && p.location.x < x+w) {
      p.velocity.y = p.velocity.y*-0.7;
    }
  }
}
