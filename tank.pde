float angle;

PVector enemyPos;
PVector enemySpeed;

PVector myTankPos;
PVector myTankSpeed;
int myTankMult;

PVector bulletPos;
PVector bulletAngle;
boolean bulletStart;
int bulletMult;

float x;
float y;



PImage tank;
PImage enemy;
int mult;

void setup() {
 
  bulletPos = new PVector(-10, -10);
  bulletAngle = new PVector(0, 0);
  
  size(1742, 980);
  frameRate(144);
  rectMode(CENTER);

  //voresTank
  tank = loadImage("PlayerBlue.PNG");
  myTankPos = new PVector(50, 50);
  myTankSpeed = new PVector(0, 0);
  myTankMult = 3;
  bulletStart = false;
  


  //enemy
  enemy = loadImage("enemyTank.png");
  enemyPos  = new PVector(width/2, height/2);
  enemySpeed = PVector.random2D();
  mult = 1;
  
  //bullet
  bulletMult = 3;
  
  
}

void draw() {  
  
  
  
  
  
  background(0);
  circle(bulletPos.x, bulletPos.y, 20);
  
  //enemy
  image(enemy, enemyPos.x, enemyPos.y);

  // Calculate the angle of rotation based on mouseX and mouseY
  angle = atan2(mouseY - myTankPos.y / 2, mouseX - myTankPos.x / 2);

  translate(myTankPos.x / 2, myTankPos.y / 2);
  rotate(angle);
  
  image(tank, -tank.width / 2, -tank.height / 2);

  // gå
  enemyPos.add(new PVector(enemySpeed.x, enemySpeed.y).mult(mult));
  
  myTankPos.add(new PVector(myTankSpeed.x, myTankSpeed.y).mult(myTankMult));
  
  
  
  
  //bullet
  if(bulletStart == true){
    bulletPos.add(new PVector(bulletAngle.x, bulletAngle.y).mult(bulletMult));
    
    println(bulletAngle, bulletPos);
  }
  
  
  //ikke gå ud fra skærmen
  if (enemyPos.y < -5 || enemyPos.y > height-55) {
    enemySpeed.y = -enemySpeed.y;
  }
  if (enemyPos.x < -5 || enemyPos.x > width-55) {
    enemySpeed.x = -enemySpeed.x;
  }
  
  if(myTankPos.y <= 5){
    myTankPos.y = 5;
  }
  if(myTankPos.y >= height*2){
    myTankPos.y = height*2;
  }
  if(myTankPos.x <= 5){
    myTankPos.x = 5;
  }
  if(myTankPos.x >= width*2){
    myTankPos.x = width*2;
  }
}


void keyPressed() {
  if (key == 'w' || key == 'W') {
    myTankSpeed.y = -1;
  }
  if (key == 's' || key == 'S') {
    myTankSpeed.y = 1;
  }
  if (key == 'a' || key == 'A') {
    myTankSpeed.x = -1;
  }
  if (key == 'd' || key == 'D') {
    myTankSpeed.x = 1;
  }
  if (key == 't' || key == 'T') {
    bulletPos.x = myTankPos.x/2;
    bulletPos.y = myTankPos.y/2;
    
    bulletAngle.x = cos(angle);
    bulletAngle.y = sin(angle);
    bulletStart = true;
    
  }
  
}

void keyReleased() {
  if (key == 'w' || key == 'W' ) {
    myTankSpeed.y = 0;
  }
  if (key == 's' || key == 'S') {
    myTankSpeed.y = 0; 
  }
  if (key == 'a' || key == 'A') {
    myTankSpeed.x = 0;
  }
  if (key == 'd' || key == 'D') {
    myTankSpeed.x = 0;
  }
}
