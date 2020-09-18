class Button {
  int platformId;
  PVector location;
  boolean down;

  Button(float x, float y, int id) {
    location = new PVector(x, y);
    platformId = id;
    down = false;
  }

  void display() {
    fill(255, 255, 0);
//    rect(location.x, location.y, 50, 20);
 image(grafikKnap,location.x,location.y-10,50,30);
  }

  void checkStep() {
    // from left
    //println(frameCount, player1.location.x < location.x+50, player1.location.x > location.x, player1.location.y+50 < location.y+20, player1.location.y+50 > location.y);
    //println(frameCount, player2.location.x < location.x+50, player2.location.x > location.x, player2.location.y+50 < location.y+20, player2.location.y+50 > location.y);

    if (player1.location.x < location.x+50 && player1.location.x > location.x && player1.location.y+50 < location.y+20 && player1.location.y+50 > location.y) {
      //println(p.location.x < location.x+50,p.location.x > location.x,p.location.y+50 < location.y+20,p.location.y+50 > location.y);
      platforms.get(platformId).down();
      down = true;
      //println("down");
    } else if (player2.location.x < location.x+50 && player2.location.x > location.x && player2.location.y+50 < location.y+20 && player2.location.y+50 > location.y) {
      //println(p.location.x < location.x+50,p.location.x > location.x,p.location.y+50 < location.y+20,p.location.y+50 > location.y);
      platforms.get(platformId).down();
      down = true;
      //println("down2");
    } else {
      down = false;
      platforms.get(platformId).up();
    }
  }
}
