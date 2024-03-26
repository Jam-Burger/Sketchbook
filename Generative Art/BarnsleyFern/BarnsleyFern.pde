float x, y, xn, yn;
void setup() {
  size(1200, 600);
  x = 0.0;
  y = 0.0;
  xn = 0.0;
  yn = 0.0;
  background(0);
  colorMode(HSB);
  stroke(#1D9826, 100);
  strokeWeight(0.5);
}

void draw() {
  translate(0, height/2);
  rotate(-HALF_PI);
  for (int i=0; i<10000; i++) {
    float r = random(1);
    if (r < 0.01) {
      xn = 0.0;
      yn = 0.16 * y;
    } else if (r < 0.86) {
      xn = 0.85 * x + 0.04 * y;
      yn = -0.04 * x + 0.85 * y + 1.6;
    } else if (r < 0.93) {
      xn = 0.2 * x - 0.26 * y;
      yn = 0.23 * x + 0.22 * y + 1.6;
    } else {
      xn = -0.15 * x + 0.28 * y;
      yn = 0.26 * x + 0.24 * y + 0.44;
    }
    point(xn*100, yn*100);
    x = xn;
    y = yn;
  }
  if (frameCount>500) {
    noLoop();
    save("leaf.png");
    background(0);
    println("finished!");
  }
}
