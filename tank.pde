PVector enemyPos;
PVector enemySpeed;

PVector myTankPos;
PVector myTankSpeed;
int myTankMult;

int myTankX;
int myTankY;

PImage tank;
PImage enemy;
int mult;

void setup() {
  size(1920, 1080);
  frameRate(144);
  rectMode(CENTER);

  //voresTank
  tank = loadImage("PlayerBlue.PNG");
  myTankPos = new PVector(0, 0);
  myTankSpeed = new PVector(0, 0);
  myTankMult = 3;


  //enemy
  enemy = loadImage("PlayerBlue.PNG");
  enemyPos  = new PVector(width/2, height/2);
  enemySpeed = PVector.random2D();
  mult = 2;
}

void draw() {
  background(0);
  //enemy
  image(enemy, enemyPos.x, enemyPos.y);

  // Calculate the angle of rotation based on mouseX and mouseY
  float angle = atan2(mouseY - myTankPos.y / 2, mouseX - myTankPos.x / 2);

  translate(myTankPos.x / 2, myTankPos.y / 2);
  rotate(angle);

  // walk
  enemyPos.add(new PVector(enemySpeed.x, enemySpeed.y).mult(mult));
  myTankPos.add(new PVector(myTankSpeed.x, myTankSpeed.y).mult(myTankMult));

  image(tank, -tank.width / 2, -tank.height / 2);

  println(myTankSpeed);

  if (enemyPos.y < 0 || enemyPos.y > height) {
    enemySpeed.y = -enemySpeed.y;
  }

  if (enemyPos.x < 0 || enemyPos.x > width) {
    enemySpeed.x = -enemySpeed.x;
  }
}


void keyPressed() {
  if (key == 'w' || key == 'W') {
    myTankSpeed.y = -1;
  }
  if (key == 's' || key == 'S') {
    myTankY += 20;
    myTankSpeed.y = 1;
  }
  if (key == 'a' || key == 'A') {
    myTankSpeed.x = -1;
  }
  if (key == 'd' || key == 'D') {
    myTankSpeed.x = 1;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
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
