class Drip {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float diameter, state;

  int etage;

  boolean splash;

  Drip(float x, float y, float d, float s, int e) {
    location = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector(0, 0.1);
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

    if (etage == 1) {
      if (location.y > 110) {
        splash = true;
      }
    }
    if (etage == 2) {
      if (location.y > 280) {
        splash = true;
      }
    }
  }
}
