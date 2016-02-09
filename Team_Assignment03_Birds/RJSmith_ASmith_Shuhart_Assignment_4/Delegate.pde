class Delegate {
  final static float GRAVITY = 9.81 / 30.0; // scaled down because science
  final static int MAX_VAL = 255;
  final static int MIN_VAL = 240;
  final static float MIN_SIZE= 5.0;
  final static float MAX_SIZE= 10.0;
  
  final int r = floor(random(MIN_VAL, MAX_VAL));
  final int g = floor(random(MIN_VAL, MAX_VAL));
  final int b = floor(random(MIN_VAL, MAX_VAL));
  final float size = random(MIN_SIZE, MAX_SIZE);
  
  String party;
  String candidate;
  
  float mult_factor;
  float bottom_X;
  
  float startX;
  float startY;
  float yPos;
  float speed;
  int ct = 0;
  
  boolean dropped = false;
  
  Delegate(String party, String candidate) {
    this.party = party;
    this.candidate = candidate;
  }
  
  void DropDelegate(float startX, float startY, float factor) {
    this.startX = startX;
    this.startY = startY;
    this.yPos = startY;
    this.speed = GRAVITY;
    
    this.mult_factor = factor;
    this.bottom_X = height*this.mult_factor + random(-5,5);
    
    dropped = true;
  }
  
  void drawExcretion() {
    // color that shite in
    colorExcretion();
    
    // Build the shape (gr0ss)
    ellipse(startX, yPos, size * 1.123456 /*because science*/, size - 1.123456 /*because science*/);
    noStroke();
    
    if(yPos < this.bottom_X) {
      yPos += speed;
      speed = gravity(ct++);
    } else {
      // Pass
    }
  }
  
  // Set the bird color. Also, depending on the bird, set its size
  void colorExcretion() {
    fill(r,g,b);
  }
  
  float gravity(int secs) {
    return GRAVITY * (secs * secs);
  }
}