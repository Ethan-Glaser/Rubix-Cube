//Color List
color black = color(0);
color white = color(255);
color red = color(255,0,0);
color green = color(0,255,0);
color blue = color(0,0,255);
color yellow = color(255,255,0);
color orange = color(255,140,0);
//

//Camera Value's
float xCamCord =0;
float yCamCord = 0;
float zCamCord = 0;
int turning = 0;
float nmouseX;
float nmouseY;
//

//Cube information
int demention = 3;
int centerBlock = (int)Math.pow(demention, 3) / 2;
Cube cubeO = new Cube(demention);
//



void setup()
{
  strokeWeight(3);
  size(1500,1500,P3D);
  background(255);
}

void draw()
{
  background(255);
  changeCam();
  translate(cubeO.getBlock(centerBlock).getX(),cubeO.getBlock(centerBlock).getY(),cubeO.getBlock(centerBlock).getZ());
  rotateX(zCamCord);
  rotateY(xCamCord);
  rotateZ(yCamCord); 
  translate(-cubeO.getBlock(centerBlock).getX(),-cubeO.getBlock(centerBlock).getY(),-cubeO.getBlock(centerBlock).getZ());
  cubeO.show();
  translate(400,400,400);
  camera(100,-100,100, cubeO.getBlock(centerBlock).getX(), cubeO.getBlock(centerBlock).getY(),cubeO.getBlock(centerBlock).getZ(),0.0,1.0,0.0);
  if(Math.abs(xCamCord)>= 2 * PI)
    xCamCord = 0;
  if(Math.abs(yCamCord)>= 2 * PI)
    yCamCord = 0;
  if(Math.abs(zCamCord)>= 2 * PI)
    zCamCord = 0;
}





//Camera Functions

void changeCam()
{
   switch(turning){
    case 1:
      yCamCord-= .01*PI/2;
      if(round(yCamCord * 1000) % round(PI/2 * 1000) == 0)
        turning = 0;
    break;
    case 2:
      yCamCord+= .01*PI/2;
      if(round(yCamCord * 1000) % round(PI/2 * 1000) == 0)
        turning = 0;
    break;
    case 3:
      xCamCord-= .01*PI/2;
      if(round(xCamCord * 1000) % round(PI/2 * 1000) == 0)
        turning = 0;
    break;
    case 4:
      xCamCord+= .01*PI/2;
      if(round(xCamCord * 10000) % round(PI/2 * 10000) == 0)
        turning = 0;
    break;
    case 5:
      zCamCord-= .01*PI/2;
      if(round(zCamCord * 10000) % round(PI/2 * 10000) == 0)
        turning = 0;
    break;
    case 6:
      zCamCord+= .01*PI/2;
      if(round(zCamCord * 10000) % round(PI/2 * 10000) == 0)
        turning = 0;
    break;
  }
}

void keyPressed() 
{
  if(key == 's')
    cubeO.scramble();
  if (key == CODED) 
  {
    if (keyCode == UP) {
      turning =1;
    } else if (keyCode == DOWN) {
      turning =2;
    } else if (keyCode == LEFT) {
      turning =3;
    }else if (keyCode == RIGHT) {
      turning =4;
    }else if (keyCode == ALT) {
      turning =5;
    }else if (keyCode == CONTROL) {
      turning =6;
    }
  }
  else if((int)key > 48 && (int)key < 49 +demention*3)
  {
      cubeO.turn((int)key - 48);
  }
}
//


void mousePressed()
{
  nmouseX = mouseX;
  nmouseY = mouseY;
  
}

void mouseReleased()
{
  float opp, adj, degree;
  opp = mouseX - nmouseX;
  adj = mouseY - nmouseY;
  degree = atan(opp/adj);
  if(degree > 0 && degree <= PI/20)
    turning =4;
  else if(degree > PI/20 && degree<= PI*9/20)
    turning = 5;
  else if(degree > PI*9/20 && degree<= PI*9/20)
    turning = 1;
  else if(degree > -PI/20 && degree<= 0)
    turning = 3;
  else if(degree > -PI*9/20 && degree<= -PI/20)
    turning = 6;
  else
    turning = 2;
}
