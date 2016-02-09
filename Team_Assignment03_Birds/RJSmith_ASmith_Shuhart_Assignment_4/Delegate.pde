// Class that holds delegates. The BomberBird will drop the delegates
class Delegate {
  float xpos;
  float ypos;
  float speedY = 1;

  // Constructor. Randomly set up the bird properties.
  Delegate(float x, float y, int party) {
    xpos = x;
    ypos = y;
  }
    
   void DrawDelegate() {
     fill(255);
     ellipse(xpos, ypos, 15, 15);
     if (ypos < height) {
      speedY = speedY * 1.001;
      ypos = ypos + speedY;
     }
   }
}