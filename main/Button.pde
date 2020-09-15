class Button {
  int platformId;
  PVector location;

  Button(float x, float y, int id) {
    location = new PVector(x, y);
    platformId = id;
  }

  void display() {
    fill(255, 255, 0);
    rect(location.x, location.y, 50, 20);
  }

  void checkStep(Player p) {
    // from left
    if (p.location.x+p.w > location.x && p.location.x+p.w < location.x+50 && p.location.y+50 < location.y+20 && p.location.y+50 > location.y) {
      //println("STEP!!!");
      platforms.get(platformId).down();
    }
    if (p.location.x < location.x+50 && p.location.x > location.x && p.location.y+50 < location.y+20 && p.location.y+50 > location.y) {
      //println(p.location.x < location.x+50,p.location.x > location.x,p.location.y+50 < location.y+20,p.location.y+50 > location.y);
      platforms.get(platformId).down();
    } else {
      platforms.get(platformId).up();
    }
  }
}
