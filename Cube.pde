class Cube
{
  //Private Varibles
  private int size;
  private Block[][][] permutation;
  //
  
  //Constructor
  Cube(int n)
  {
    size = n;
    permutation = new Block[size][size][size];
    int c = 0;
    for(int i = 0; i <  size; i++) 
    {
      for(int j = 0; j <  size; j++) 
      {
        for(int k = 0; k <  size; k++) 
        { 
          permutation[i][j][k] = new Block(n,c);
          c++;
        }
      }
    }
    
  }
  //
  
  
  //Setters and Getters
  public Block getBlock(int i){
  return permutation[i / (size*size)][i %(size*size)/ size][i % size]; }
  public void setBlock(int i, Block s)
  {
    for(int j = 0; j < 6; j++)
    {
      permutation[i / (size*size)][i %(size*size)/size][i % size].changeColor(j,s.getColor(j)); //<>//
    }
  }
  //
  
  
  
  public void show()
  {
    for(Block[][] i : permutation)
      for(Block[] j : i)
        for(Block b : j)
          b.show();
  }
  
  public void scramble()
  {
    int numSpin = (int) (Math.random()*100+100);
    for(int i = 0; i < numSpin; i++)
    {
      int turns = (int)(Math.random()*3+1);
      int rmat = (int)(Math.random() *size*size +1);
      for(int j =0; j < turns; j++)
      {
        turn(rmat);
      }
    }
  }
  
  
  
  public void turn(int matrix)
  {
    
        for(int i = 0; i <  size-1; i++) 
        { 
          int alpha = turnNum(i,matrix);
          int beta =turnNum((size-1-i)*size,matrix);
          int cappa =turnNum(size*size-1-i,matrix);
          int delta =turnNum((size-1)+ i*size,matrix);
          color[] atemp = new color[6];  //<>//
          for(int j = 0; j < 6 ; j++)
           {
             atemp[j] = getBlock(alpha).getColor(j);
           }
           Block temp = new Block(size,alpha, atemp);
           setBlock(alpha, getBlock(beta));
           setBlock(beta,getBlock(cappa));
           setBlock(cappa, getBlock(delta));
           setBlock(delta, temp);
           getBlock(alpha).turn(matrix);
           getBlock(beta).turn(matrix);
           getBlock(cappa).turn(matrix);
           getBlock(delta).turn(matrix);
        }
  }
  
  public int turnNum(int n, int matrix)
  {  
    if(matrix <= size)
       n+=size*size*((matrix -1)%size);
    else if(matrix <= size*2)
       n=(size -1 -(n%size))*size*size + size*(n/size)+(matrix -1)%size;
    else
       n=n %(size) + (size-1 -(n/size))*size*size + (matrix-1)%size * size;
    return n;
  }


  //<>//

}
