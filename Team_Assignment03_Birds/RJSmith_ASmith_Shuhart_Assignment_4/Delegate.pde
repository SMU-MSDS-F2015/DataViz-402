class Delegate {
  final static float GRAVITY = 9.81 / 30.0; // scaled down because science
  final float size = 15;
  
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
  
  // Set the color based on party of the delegate
  void colorExcretion() {
    if (party.toUpperCase().startsWith("R")) {
      fill(0, 0, 150);
    } else {
      fill(200, 0, 0);
    }
  }
  
  float gravity(int secs) {
    return GRAVITY * (secs * secs);
  }
}