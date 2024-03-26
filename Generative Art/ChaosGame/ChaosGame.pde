int n= 8;
float r= n==4 ? 2f/3 : optimalR(n);
int speed= 10000;
PVector[] vertices;
PVector current;
void setup() {
  //size(1000, 1000);
  fullScreen();
  colorMode(HSB);
  background(0);

  if (n==4) {
    vertices= new PVector[8];
  } else {
    vertices= new PVector[n];
  }
  for (int i=0; i<n; i++) {
    vertices[i]= PVector.fromAngle(TWO_PI*i/n - HALF_PI);
    //vertices[i]= PVector.random2D();
    vertices[i].mult(min(width, height)/2.3);
  }
  if (n==4) {
    for (int i=0; i<n; i++) {
      vertices[i+4]= PVector.add(vertices[i], vertices[(i+1)%4]);
      vertices[i+4].div(2);
    }
  }

  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2);
  for (PVector v : vertices) {
    point(v.x, v.y);
  }
  current= new PVector(random(width), random(height));
  strokeWeight(0.5);
}

int last= 0;
void draw() {
  translate(width/2, height/2);
  for (int i=0; i<speed; i++) {
    int targetIndex= floor(random(vertices.length));
    //if(n==4 && circularDistance(targetIndex, last, n)==2) continue; // distance condition
    if (n==4) stroke(targetIndex*255/8, 255, 255, 100);
    else stroke(targetIndex*255/n, 255, 255, 100);
    PVector target= vertices[targetIndex];
    current= current.lerp(target, r);
    point(current.x, current.y);
    last= targetIndex;
  }

  if (frameCount>1000) {
    noLoop();
    save("images/chaos"+n+".png");
    background(0);
    println("finished!");
  }
}

float optimalR(int N) {
  float a= 0;
  float theta= PI*(1 - 2f/N);
  for (int i=1; i<=N/4; i++) {
    a+=cos(i*(PI-theta));
  }

  float r= (1+2*a)/(2+2*a);
  return r;
}

int circularDistance(int a, int b, int n) {
  return min(abs(b-a), n-abs(b-a));
}
