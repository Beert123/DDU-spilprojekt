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
    rect(posX+200, posY+200, bredde, hoejde);
    fill(0);
    text("Next", posX+230, posY+55+200);
  }

  void knap() {
    if (!nc) {
      if (mouseX > posX+200 && mouseX < posX+200+bredde && mouseY > posY+200 && mouseY < posY+200+hoejde) {
        c = 175;
      } else {
        c = 255;
      }
      if (mousePressed) {
        if (mouseX > posX+200 && mouseX < posX+200+bredde && mouseY > posY+200 && mouseY < posY+200+hoejde) {
          println("ready");
          EndScreenDone = true;
          nc = true;
        }
        if(nc){
          c = 175;
        }
      }
    }
  }
}
