class Complex{
  double re, im, freq= random(-0.01, 0.01);
  Complex(){
    re = 0;
    im = 0;
  }
  Complex(double r, double i){
    re = r;
    im = i;
  }
  void add(Complex b){
    re += b.re;
    im += b.im;
  }
  void mult(double n){
    re *= n;
    im *= n;
  }
  float amp(){
    return (float)Math.sqrt(re*re + im*im);
  }
  double phase(){
    return Math.atan2(im, re);
  }
  void div(double n){
    mult(1/n);
  }
  void mult(Complex o){
    double a = re, b = im, c= o.re, d= o.im;
    re = a * c - b * d;
    im = a * d + b * c;
  }
}
