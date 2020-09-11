class Platform{
  PVector location;
  float xpos, ypos, ymove;
  float sizex, sizey;
  float period;
  float amplitude;
  
  int player;
  
  Platform(float x, float y, float a, float p, float sx, float sy){
    amplitude = a;
    period = p;
    xpos = x;
    ypos = y;
    sizex = sx;
    sizey = sy;
  }
  void display(){
    ymove = amplitude * cos(TWO_PI * frameCount/period);
    stroke(0);
    rect(xpos, ypos+ymove, sizex, sizey);
  }
  void collision(Player p){
    /*if(p.location.x > xpos && p.location.x < xpos+sizex && p.location.y+p.h > ypos+100 && p.location.y+p.h < ypos-100){
      p.location.y = ypos;
    }
    if(p.location.x > xpos && p.location.x < xpos+sizex && p.location.y > ypos+sizey+100 && p.location.y < ypos+sizey-100){
      p.location.y = ypos+sizey;
    }
    if(p.location.x+p.w > xpos-2 && p.location.x+p.w < xpos+2 && p.location.y+p.h < ypos){
      p.location.x = p.w+ypos;
    }*/
    
    if (p.location.y+60 == ypos && p.location.x > xpos) {
      p.location.y = ypos;
    }
  }
}
