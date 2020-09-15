class Menu {

  //  boolean isThisANewLevel = true;  //level generatoren skal kun køre 1 gang
  float posX, posY, bredde, hojde, colorr;
  boolean levelStart;

  Menu(int x, int y, int w, int h) {

    posX=x;
    posY=y;
    bredde=w;
    hojde=h;
    levelStart = false;
  }

  void display() {
    
    rectMode(CENTER);
    textMode(CENTER);
    rect(posX, posY, bredde, hojde);
    text("Online", posX, posY);
    text("Offline", posX, posY);
    rect(posX+200, posY, bredde, hojde);
  }

  void knap() {
    if (mousePressed) {  
      if (mouseX < posX + bredde/2 && mouseX > posX/2 && mouseY > posY/2 && mouseY < posY+hojde/2) {
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
