class Menu {

  //  boolean isThisANewLevel = true;  //level generatoren skal kun køre 1 gang
  float posX, posY, posX2, posY2, bredde, hoejde, colorr;
  boolean levelStart;

  boolean online, offline, lvl1, lvl2, hover1, hover2, ready;
  
  int levelId;

  color c1, c2, c3, c4, c5;

  Menu(int x1, int y1, int x2, int y2, int w, int h) {

    posX = x1;
    posY = y1;
    posX2 = x2;
    posY2 = y2;
    bredde = w;
    hoejde = h;
    levelStart = false;
    c1 = 255;
    c2 = 255;
    c3 = 255;
    c4 = 255;
    c5 = 255;
    
    levelId = 3;
  }

  void display() {
    //translate(width/2-150, height/2-50);
    //rectMode(CENTER);
    //textMode(CENTER);
    fill(c1);
    rect(posX, posY, bredde, hoejde);
    fill(c2);
    rect(posX+200, posY, bredde, hoejde);
    fill(c3);
    rect(posX2, posY2, bredde, hoejde);
    fill(c4);
    rect(posX2+200, posY2, bredde, hoejde);
    fill(c5);
    rect(posX2+400, posY2, bredde, hoejde);
    rect(posX2+200, posY2+200, bredde, hoejde);
    fill(0);
    textSize(18);
    text("Online", posX+20, posY+55);
    text("Offline", posX+220, posY+55);

    text("Level 1", posX2+20, posY2+55);
    text("Level 2", posX2+220, posY2+55);
    text("Level 3", posX2+420, posY2+55);
  }

  void knap() {
    if (!online) {
      if (mouseX > posX && mouseX < posX+bredde && mouseY > posY && mouseY < posY+hoejde) {
        c1 = 175;
      } else {
        c1 = 255;
      }
    }
    if (!offline) {
      if (mouseX > posX+200 && mouseX < posX+bredde+200 && mouseY > posY && mouseY < posY+hoejde) {
        c2 = 175;
      } else {
        c2 = 255;
      }
    }
    if (mousePressed) {
      println(mouseX, mouseY);
      if (mouseX > posX && mouseX < posX+bredde && mouseY > posY && mouseY < posY+hoejde) {
        println("CLICK");
        online = true;
        offline = false;
      }

      if (mouseX > posX+200 && mouseX < posX+bredde+200 && mouseY > posY && mouseY < posY+hoejde) {
        println("CLOCK");
        online = false;
        offline = true;
      }

      if (mouseX > posX2 && mouseX < posX2+bredde && mouseY > posY2 && mouseY < posY2+hoejde) {
        levelId = 1;
        println("LVL1");
      }
      if (mouseX > posX2+200 && mouseX < posX2+bredde+200 && mouseY > posY2 && mouseY < posY2+hoejde) {
        levelId = 2;
        println("LVL2");
      }
      if (mouseX > posX2+400 && mouseX < posX2+bredde+400 && mouseY > posY2 && mouseY < posY2+hoejde) {
        levelId = 3;
        println("LVL3");
      }
      if(mouseX > posX2+200 && mouseX < posX2+200+bredde && mouseY > posY2+200 && mouseY < posY2+200+hoejde){
        println("ready");
        ready = true;
      }
      if (online) {
        c1 = 175;
        c2 = 255;
      }
      if (offline) {
        c1 = 255;
        c2 = 175;
      }
    }
  }




  /*
   switch(level) {
   case 0:
   menu();
   break;
   case 1:
   level1();
   break;
   case 2:
   level2();
   break;
   }

   void menu(){
   }

   void level1() {
   if (isThisANewLevel) {
   gen.generateLevel(e1, e2, e3, e4, e5, w1, w2, w3, w4, w5, h1, h2, h3, h4, h5, y1, y2, y3, y4, y5);
   genD.generateDiamonds(x, y, t, 3);
   isThisANewLevel = false;
   }


   for(int i = 0; i < maal.size(); i++){
   Maal m = maal.get(i);

   m.collision(player1);
   m.collision(player2);
   if(maal1.sejr1 && maal2.sejr2){
   goToLevel2();
   }
   }
   }

   void level2() {
   clear();

   }

   void goToLevel1(){
   level =1;
   }

   void goToLevel2() {
   level= 2;
   }
   */
}
