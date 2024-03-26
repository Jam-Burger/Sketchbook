class Epicycle {
  PVector pos;
  float time = 0;
  Complex[] fourier;
  ArrayList<PVector> path;
  Epicycle(PVector pos, Complex[] x) {
    this.pos = pos;
    path= new ArrayList<PVector>();
    fourier = dft(x);
  }
  void show() {
    translate(pos.x, pos.y);
    float x=0, y=0;
    for (int i =0; i<fourier.length; i++) {
      float prevx= x, prevy= y;
      Complex c = fourier[i];
      float radius = c.amp();
      double phi = c.freq * time + c.phase();
      x += radius * Math.cos(phi);
      y += radius * Math.sin(phi);

      stroke(255, 100);
      ellipse(prevx, prevy, radius*2, radius*2);
      stroke(255, 140);
      line(prevx, prevy, x, y);
    }
    path.add(0, new PVector(x, y));
    stroke(#FFFF00);
    strokeWeight(2);
    beginShape();
    for (PVector v : path) {
      vertex(v.x, v.y);
    }
    endShape();
    float dt = TWO_PI / fourier.length;
    time += dt;
    if (time > TWO_PI) {
      path.clear();
      noLoop();
      time = 0;
    }
  }
}
