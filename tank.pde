int x;
int y;

PImage tank;

void setup() {
  size(1920, 1080);
  frameRate(144);
  rectMode(CENTER);
  
  tank = loadImage("Tank1.jpg");
}

void draw() {
  background(0);
  
  // Calculate the angle of rotation based on mouseX and mouseY
  float angle = atan2(mouseY - y / 2, mouseX - x / 2);
  
  translate(x / 2, y / 2);
  rotate(angle);
  
  // Draw the rotated tank image
  image(tank, -tank.width / 2, -tank.height / 2);
  
}

void keyPressed(){
  if(key == 'w'){
    y += -20;
  }
  if(key == 's'){
    y += 20;
  }
  if(key == 'a'){
    x += -20;
  }
  if(key == 'd'){
    x += 20;
  }
}
