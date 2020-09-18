class EndScreen {
  float posX, posY, bredde, hoejde;

  boolean EndScreenDone, nc;

  color c;

  EndScreen(int x, int y, int w, int h) {
    posX = x;
    posY = y;
    bredde = w;
    hoejde = h;

    c = 255;

    EndScreenDone = true;
  }

  void display() {
    background(255);
    fill(c);
    rect(posX+400, posY+200, bredde, hoejde);
    fill(0);
    text("Next", posX+430, posY+55+200);

    fill(255, 254, 0);
    star(posX+25, posY+50, 30, 70, 5);
    fill(255);
    if (menu.levelId == 1 && m < 42000) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 2 && m < 35000) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 3 && m < 60000) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 1 && player1.point == 3 && player2.point == 3) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 2 && player1.point == 3 && player2.point == 3) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 3 && player1.point == 3 && player2.point == 3) {
      fill(255, 254, 0);
    }
    star(posX+225, posY+50, 30, 70, 5);
    fill(255);
    if (menu.levelId == 1 && player1.point == 3 && player2.point == 3 && m < 42000) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 2 && player1.point == 3 && player2.point == 3 && m < 35000) {
      fill(255, 254, 0);
    }
    if (menu.levelId == 3 && player1.point == 3 && player2.point == 3 && m < 60000) {
      fill(255, 254, 0);
    }
    star(posX+425, posY+50, 30, 70, 5);
    println(menu.levelId, player1.point+player2.point, m);
  }

  void knap() {
    if (!nc) {
      if (mouseX > posX+400 && mouseX < posX+400+bredde && mouseY > posY+200 && mouseY < posY+200+hoejde) {
        c = 175;
      } else {
        c = 255;
      }
      if (mousePressed) {
        if (mouseX > posX+400 && mouseX < posX+400+bredde && mouseY > posY+200 && mouseY < posY+200+hoejde) {
          println("ready");
          EndScreenDone = true;
          nc = true;
          menu.rc = false;
          player1.revive();
          player2.revive();
        }
        if (nc) {
          c = 175;
        }
      }
    }
  }
  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
