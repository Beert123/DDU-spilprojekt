class Maal{
 PVector location = new PVector(); 
 PVector bigness= new PVector();
  
  Maal(float x, float y, float bigX, float bigY){
    location.x = x;
    location.y =y;
    bigness.x = bigX;
    bigness.y =bigY;
  }
  void display(){
    fill(0,0,125);
    rect(location.x ,location.y,bigness.x,bigness.y);
    
  }
  void collision(Player p){
  /*  if(p.location.x+p.w ==location.x +bigness.x){
      
    }*/
  }

}
