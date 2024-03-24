int l= 5;
int[][] grid;
int cols;
int rows;
void setup() {
  fullScreen();
  stroke(0);
  fill(255);
  //noCursor();
  cols = width / l;
  rows = height / l;
  grid= new int[cols][rows];
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      grid[x][y]= floor(random(2));
    }
  }
  //noLoop();
}
void draw() {
  background(0);
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (grid[x][y]==1) rect(x*l, y*l, l, l);
    }
  }

  int[][] next= new int[cols][rows];
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      int count= 0;
      for (int dx= -1; dx < 2; dx++) {
        for (int dy= -1; dy < 2; dy++) {
          int nx= (x+dx+cols)%(cols);
          int ny= (y+dy+rows)%(rows);
          count += grid[nx][ny];
        }
      }
      int state= grid[x][y];
      count-= state;
      if (state==0 && count==3) next[x][y]= 1;
      else if (state==1 && count<2 || count>3) next[x][y]= 0;
      else next[x][y]= state;
    }
  }
  grid= next;
}
