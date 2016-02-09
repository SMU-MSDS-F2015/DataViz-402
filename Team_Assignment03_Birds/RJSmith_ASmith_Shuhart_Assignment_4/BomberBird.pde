class BomberBird extends Bird
{
  
  // Hard code this for now
  Delegate[] delegates = new Delegate[100];
  int delegateNumber = 0;
  
  BomberBird() {
    super();
    speciesNumber = 5; // Bomber is the fifth species
  }
  
  // Bomber is Big, and Purple
  void setSpecies() {
      size = 2;
      fill(200, 0, 230);
  }
  
  void drawBird() {
    super.drawBird();
    // Hard code this to when bomber hit pos % 100
    
    if (xpos % 100 < speedX)
    {
      println("Dropping a delegate!");
      delegateNumber++;
      // Hard code to democrat for now
      delegates[delegateNumber - 1] = new Delegate(xpos, ypos, 1);
    }
    
    for(int i = 0; i < delegateNumber; i++) {
      delegates[delegateNumber - 1].DrawDelegate();
    }
  }
}