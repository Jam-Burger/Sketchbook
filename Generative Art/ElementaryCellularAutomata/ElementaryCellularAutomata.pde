final int windowSize= 255;
final int n= windowSize*2;
final int multiplier= 1;
final int sw= 1;

int rule= 29;
boolean changeRule= true;
boolean save= false;
float w;

boolean cells[];
int iter;
void setup() {
  fullScreen();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  textSize(25);
  w= float(width)/windowSize;

  reset();
}

void draw() {
  for (int s=0; s<multiplier; s++) {
    pushMatrix();
    noStroke();
    fill(0);
    translate((windowSize-n)*w/2, 0);
    for (int i=0; i<n; i++) {
      if (cells[i]) rect(i*w+w/2, (iter % (windowSize/2))*w+w/2, w, w);
    }
    popMatrix();
    pushMatrix();
    translate(width/2, height - (height-windowSize*w/2)/2);
    fill(255);
    stroke(0);
    rect(0, 0, width, height-windowSize*w/2);
    fill(0);
    text("Rule: " + rule, 0, 0, width, height-windowSize*w/2);
    popMatrix();

    boolean[] newCells= new boolean[n];
    for (int i=1; i<n-1; i++) {
      boolean a= cells[(i-1+n)%n];
      boolean b= cells[i];
      boolean c= cells[(i+1)%n];
      newCells[i]= compute(a, b, c);
    }

    if (iter!=0 && iter % (windowSize/2) == 0) {
      if (changeRule) {
        if (save) save("images/rule"+rule+".png");
        rule++;
        reset();
      } else {
        cells= newCells;
        iter++;
      }
    } else {
      cells= newCells;
      iter++;
    }

    if (iter==n) {
      fill(0, 100);
      rect(width/2, height/2, width, height);
      noLoop();
    }
  }
}

void reset() {
  iter= 0;
  cells= new boolean[n];
  cells[n/2]= true;
  background(255);
}

boolean compute(boolean a, boolean b, boolean c) {
  int x= (a ? 4 : 0) + (b ? 2 : 0) + (c ? 1 : 0);
  return ((rule >> x) & 1) == 1;
}
