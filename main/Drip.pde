class Drip {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float diameter, state,x,y;

  int etage;

  boolean splash;

  Drip(float x_, float y_, float d, float s, int e) {
    x = x_;
    y = y_;
    location = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector(0, 1);
    diameter = d;
    state = s;
    etage = e;
    splash = false;
  }
  void display() {
    if (!splash) {
      if (state == 1) {
        fill(0, 0, 255);
        ellipse(location.x, location.y, diameter, diameter);
      }
      if (state == 2) {
        fill(0, 0, 255);
        ellipse(location.x, location.y, diameter, diameter);
      }
      if (state == 3) {
        fill(0, 255, 0);
        ellipse(location.x, location.y, diameter, diameter);
      }
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

    if (location.y+diameter/2 > etage) {
      splash = true;
    }
    if(splash){
      location.set(x,y);
      splash = false;
    }
  }
}
