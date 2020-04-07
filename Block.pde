class Block
{
  
  //Private Varibles
  private color[] sides = new color[6];
  private float sideLength, x, y,z;
  //
  
  
  //Constructor
  Block(int s, int c)
  {
    sideLength = 60/s;
    x = c % s * sideLength;
    y = c %(s*s)/ s * sideLength;
    z = c / (s*s) * -sideLength;
    for(int i= 0; i < sides.length; i++)
      sides[i] = black;
    if(z == 0)
      sides[0] = red;
    if(z == (s-1) * -sideLength)                                                            // 0-front
      sides[1] = orange;                                                                    // 1-back
    if(x == 0)                                                                              // 2-left
      sides[2] = green;                                                                     // 3-right
    if(x == (s-1) * sideLength)                                                             // 4-up
      sides[3] = blue;                                                                      // 5-down
    if(y == 0)
      sides[4] = white;
    if(y == (s-1) * sideLength)
      sides[5] = yellow; 
  }
  Block(int s, int c, color[] a)
  {
    sideLength = 60/s;
    x = c % s * sideLength;
    y = c %(s*s)/ s * sideLength;
    z = c / (s*s) * -sideLength;
    sides = a;
  }
  //
  
  //Setters and Getters
  public void changeColor(int s, color c){
  sides[s] = c;}
  public color getColor(int s){
  return sides[s];}
  public void setX(float s){
  x = s;}
  public float getX(){
  return x;}
  public void setY(float s){
  y = s;}
  public float getY(){
  return y;}
  public void setZ(float s){
  z = s;}
  public float getZ(){
  return z;}
  //
  
  
  public void show()
  {
    float i = sideLength;
    translate(x,y,z);
    beginShape(QUADS);
    fill(sides[0]);
    vertex(-i/2, -i/2, i/2);
    vertex(+i/2, -i/2, i/2);
    vertex(+i/2, +i/2, i/2);
    vertex(-i/2, +i/2, i/2);
    fill(sides[1]);
    vertex(-i/2, -i/2, -i/2);
    vertex(+i/2, -i/2, -i/2);
    vertex(+i/2, +i/2, -i/2);
    vertex(-i/2, +i/2, -i/2);
    fill(sides[2]);
    vertex(-i/2, -i/2, -i/2);
    vertex(-i/2, +i/2, -i/2);
    vertex(-i/2, +i/2, +i/2);
    vertex(-i/2, -i/2, +i/2);
    fill(sides[3]);
    vertex(i/2, -i/2, -i/2);
    vertex(i/2, +i/2, -i/2);
    vertex(i/2, +i/2, +i/2);
    vertex(i/2, -i/2, +i/2);
    fill(sides[4]);
    vertex(-i/2, -i/2, -i/2);
    vertex(+i/2, -i/2, -i/2);
    vertex(+i/2, -i/2, +i/2);
    vertex(-i/2, -i/2, +i/2);
    fill(sides[5]);
    vertex(-i/2, i/2, -i/2);
    vertex(+i/2, i/2, -i/2);
    vertex(+i/2, i/2, +i/2);
    vertex(-i/2, i/2, +i/2);
    endShape(CLOSE);
    translate(-x,-y,-z);
  }
  
  public void turn(int n)
  {
    if (n <= 60/sideLength)
    {
      color temp = sides[2];
      sides[2] = sides[5];
      sides[5] = sides[3];
      sides[3] = sides[4];
      sides[4] = temp;
    }
    else if (n <= 120/sideLength)
    {
      color temp = sides[0];
      sides[0] = sides[4];
      sides[4] = sides[1];
      sides[1] = sides[5];
      sides[5] = temp;
    }
    else
    {
      color temp = sides[1];
      sides[1] = sides[2];
      sides[2] = sides[0];
      sides[0] = sides[3];
      sides[3] = temp;
    }
    
  }
  

  
  
}
