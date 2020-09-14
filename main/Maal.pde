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
  void collision(Player p) {
    // println("Checking on platform: "+i);
    // is on the platform!
// fra siden
    if (p.location.y+p.h > location.y+8 && p.location.y < location.y+bigness.y && p.location.x+p.w > location.x && p.location.x+p.w < location.x+10) {
      p.location.x = location.x-p.w;
    }
// fra siden
    if (p.location.y+p.h > location.y+8 && p.location.y < location.y+bigness.y && p.location.x < location.x+bigness.x && p.location.x > location.x+bigness.x-10) {
      p.location.x = location.x+bigness.x;
    }
//oppe fra og ned
    if (p.location.y+p.h > location.y && p.location.y <= location.y+8 && p.location.x+p.w > location.x && p.location.x < location.x+bigness.x && p.location.y+p.h < location.y+8) {
      p.location.y = location.y-60;
      p.isOnPlatform = true;
      p.isMidAir = false;
      p.velocity.set(0, 0);
    }
  }
}
