// Daniel Shiffman
// http://codingtra.in
// Fractal Spirograph
// Modified for large image render by Josef Kuchař

int k = -4;

class Orbit {
  float x;
  float y;
  float r;
  int n;
  Orbit parent;
  Orbit child;
  float speed;
  float angle;

  Orbit(float x_, float y_, float r_, int n_) {
    this(x_, y_, r_, n_, null);
  }

  Orbit(float x_, float y_, float r_, int n_, Orbit p) {
    x = x_;
    y = y_;
    r = r_;
    n = n_;
    speed = (radians(pow(k, n-1)))/resolution;
    parent = p;
    child = null;
    angle = -PI/2;
  }

  Orbit addChild() {
    float newr = r / 3.0;
    float newx = x + r + newr;
    float newy = y;
    child = new Orbit(newx, newy, newr, n+1, this);
    return child;
  }

  void update() {
    if (parent != null) {
      angle += speed;
      float rsum = r + parent.r;
      x = parent.x + rsum * cos(angle);
      y = parent.y + rsum * sin(angle);
    }
    //ellipse(x2, y2, r2*2, r2*2);
  }
}