PImage bg;
PImage groundhog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;
int soldierX;
float soldierY;
float robotX;
float robotY;
float laserX;
float laserY;
float laserLength = 0;
float laserMaxLength = 40;

void setup() {
	size(640, 480, P2D);

  soldierY=80*floor(random(2,6));
  
  robotX=80*floor(random(2,8));
  robotY=80*floor(random(2,6));
  
  bg=loadImage("img/bg.jpg");
  groundhog=loadImage("img/groundhog.png");
  life=loadImage("img/life.png");
  robot=loadImage("img/robot.png");
  soil=loadImage("img/soil.png");
  soldier=loadImage("img/soldier.png");
  laserX = robotX + 25;
  laserY = robotY + 37;
}

void draw() {
  //backgroung
  background(bg); 
  
  //soil
  image(soil,0,160); 
  
  //life
  image(life,10,10); 
  image(life,80,10);
  image(life,150,10);
  
  //grass
  noStroke(); 
  fill(124, 204, 25);
  rect(0,145,640,15);
  
  //sun
  stroke(255, 255, 0);
  strokeWeight(5);
  fill(253, 184, 19);
  ellipse(590,50,120,120);
  
  //groundhog
	image(groundhog,280,80); 
   
   //soldier animation
  image(soldier,soldierX-80,soldierY); 
  soldierX = (soldierX + 1) % 720;
  
  //robot
  image(robot,robotX,robotY); 
  
   //laser animation
  stroke(255,0,0);
  strokeWeight(10);
  line(laserX,laserY,laserX+laserLength,laserY);
  laserLength = min(laserLength+2,laserMaxLength);
  laserX -= 2; 
  
  if(laserX <= robotX-160+25){
    laserX = robotX + 25;laserLength = 0 ;
  }
}
