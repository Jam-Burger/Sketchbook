Complex[] J;
Epicycle arm;
BufferedReader reader;

void setup() {
  //size(1000, 800);
  fullScreen();
  int skip = 5;
  ArrayList<Complex> drawing= load("dragon.txt");
  
  J= new Complex[drawing.size()/skip];
  for (int i = 0; i < drawing.size()/skip; i++) {
    J[i]= drawing.get(i*skip);
  }
  arm= new Epicycle(new PVector(width/2, height/2), J);
}
void draw() {
  background(0);
  noFill();
  arm.show();
  if(frameCount%3==0) saveFrame("frames/#.png");
}
void swap(int i, int j, Complex[] arr) {
  Complex temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}
Complex[] dft(Complex[] x) {
  int N= x.length;
  //N=1000;
  Complex[] X= new Complex[N];
  for (int k = 0; k < N; k++) {
    X[k] = new Complex();
    for (int n=0; n<x.length; n++) {
      double phi= TWO_PI * k * n / N;
      Complex a = new Complex(Math.cos(phi), -Math.sin(phi));
      a.mult(x[n]);
      X[k].add(a);
    }
    X[k].freq = k;
    X[k].div(N);
  }
  for (int i=0; i<X.length-1; i++) {
    for (int j=i+1; j<X.length; j++) {
      if (X[i].amp() < X[j].amp()) {
        swap(i, j, X);
      }
    }
  }
  return X;
}

ArrayList<Complex> load(String path) {
  reader= createReader(path);
  ArrayList<Complex> f = new ArrayList<Complex>();
  String line;
  while (true) {
    try {
      line= reader.readLine();
    } 
    catch (IOException e) {
      line= null;
    }
    if (line==null) break;
    String w1, w2;
    w1=line.substring(0, line.indexOf(','));
    w2=line.substring(line.indexOf(',')+1); 
    float re = Float.parseFloat(w1);
    float im = Float.parseFloat(w2);
    f.add(new Complex(re, im));
  }
  return f;
}
