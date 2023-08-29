PImage tank;

void setup() {
  size(1920, 800
  );
  rectMode(CENTER);
  
  tank = loadImage("Tank1.jpg");
}

void draw() {
  background(0);
  
  // Calculate the angle of rotation based on mouseX and mouseY
  float angle = atan2(mouseY - height / 2, mouseX - width / 2);
  
  translate(width / 2, height / 2);
  rotate(angle);
  
  // Draw the rotated tank image
  image(tank, -tank.width / 2, -tank.height / 2);
}
