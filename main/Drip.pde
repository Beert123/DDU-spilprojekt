class Drip {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float diameter, state, x, y;

  int etage;

  boolean splash;

  Drip(float x_, float y_, float d, float s, int e) {
    x = x_;
    y = y_;
    location = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector(0, 0.05);
    diameter = d;
    state = s;
    etage = e;
    splash = false;
  }
  void display() {
    if (!splash) {
      if (state == 1) {
      //  fill(0, 0, 255);
      //  ellipse(location.x, location.y, diameter, diameter);
      image(dripBlue,location.x,location.y,diameter+20,diameter+20);
      }
      if (state == 2) {
    //    fill(255, 0, 0);
      //  ellipse(location.x, location.y, diameter, diameter);
      image(dripRed,location.x,location.y,diameter+20,diameter+20);
      }
      if (state == 3) {
        fill(0, 255, 0);
        ellipse(location.x, location.y, diameter, diameter);
      }
    }
    //println(velocity);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    if (location.y+diameter/2 > etage) {
      splash = true;
    }
    if (splash) {
      velocity.set(0,0);
      location.set(x, y);
      splash = false;
    }
  }
  void collision(Player p) {

    if (p.location.dist(location) < diameter/2+5) {
      println("JAATAKK");
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
    if (p.location.copy().add(0, p.h/2).dist(location) < diameter/2+5) {
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
    if (p.location.copy().add(0, p.h).dist(location) < diameter/2+5) {
      println("JAATAKK2");
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
    if (p.location.copy().add(p.w, 0).dist(location) < diameter/2+5) {
      println("JAATAKK3");
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
    if (p.location.copy().add(p.w, p.h/2).dist(location) < diameter/2+5) {
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
    if (p.location.copy().add(p.w, p.h).dist(location) < diameter/2+5) {
      println("JAATAKK4");
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
  }
}
