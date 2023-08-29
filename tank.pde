int x;
int y;
void setup(){
  size(1920, 1080);
  frameRate(300);
  
  x = 0;
  y = 1920;
}

void draw(){
  background(0,0,0);
  noStroke();
  smooth();
  //your tank
  filter( BLUR, 0 );
  
  fill(255,0,0);
  circle(x, height/2, 200);
  
  filter( BLUR, 6 );
  stroke(0);
  circle(x,height/2,80);
  
  
  
  //enemy tank
  filter( BLUR, 0 );
  
  fill(0,0,255);
  circle(y,height/2,100);
  
  filter( BLUR, 6 );
  stroke(0);
  circle(y,height/2,80);
  x+=10;
  y+=-10;
}
