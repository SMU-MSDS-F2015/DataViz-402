// Main class that hold bird properties, as well as drawing the bird.
class Bird {
  float xpos;
  float ypos;
  boolean faceForward;
  float speedX;
  float speedY;
  final float size;
  final Species species;
  
  
  
  // Default constructor builds a NON bomber bird
  Bird() {
    this(false);
  }

  // Constructor can build bomber bird
  Bird(final boolean isBomber) {
    xpos = random(100, width - 100);
    ypos = random(50, height - 450);

    speedX = random(.5, 2.2);
    if (random(0, 1) < 0.5) {
      speedX = -speedX;
    }

    speedY = random(.5, 2.2);
    if(random(0, 1) < 0.5) {
      speedY = -speedY;
    }
    
    // choose from 4 species
    int speciesNumber = floor(random(0, 4));            // Gets a random int between 0 (inclusive) and 4 (exclusive) -- (0,4]
    Species[] possibleSpecies = Species.values();       // Returns an ordinal array: {CARDINAL, CANARY, BLUEBIRD, CROW, BOMBER}
    this.species = isBomber ? Species.BOMBER : possibleSpecies[speciesNumber];
    this.size = species.getSize();
    

    // Set the direction bird faces based on its travel direction
    if (speedX > 0) {
      faceForward = true;
    } else {
      faceForward = false;
    }
  }

  // Draw the bird, move it, and check for collison with edge
  public void drawBird() {
    drawPt1();
    drawPt2();
  }
  
  protected void drawPt1() {
    // Set the fill, based on bird color
    // This also sets the size, which varies by the color (i.e. bird species)
    colorBird();
    
    // Draw the wings
    ellipse(xpos, ypos, 10 * size, random(5, 40*size));
    noStroke();

    // Draw the body of the bird, depending on which direction it should face
    if (faceForward) {
      triangle(xpos, ypos, xpos + 20 * size, ypos - 10 * size, xpos - 25 * size, ypos + 30 * size);
    } else {
      triangle(xpos, ypos, xpos - 20 * size, ypos - 10 * size, xpos + 25 * size, ypos + 30 * size);
    }
  }
  
  protected void drawPt2() {
    // Now, move the bird, and check for colliding with the edge
    xpos += speedX;
    ypos += speedY;
    checkCollisions();
  }

  // Set the bird color. Also, depending on the bird, set its size
  void colorBird() {
    fill(species.getR(), species.getG(), species.getB());
  }
 
  void drawBomber(){
    ellipse(xpos, ypos, 10 * size, random(5, 40*size));
    noStroke();
  
    // Draw the body of the bird, depending on which direction it should face
    if (faceForward) {
      triangle(xpos, ypos, xpos+20*size, ypos-10*size, xpos-25*size, ypos+30*size);
    }
    
    else {
      triangle(xpos, ypos, xpos-20*size, ypos-10*size, xpos+25*size, ypos+30*size);
    }
  
    // Now, move the bird, and check for colliding with the edge
    xpos += speedX;
    ypos += speedY;
    checkCollisions();
      
  }
   
  // Check if bird hits wall, and reflect the speed accordingly.
  // If hitting left/right wall, change bird's direction
  void checkCollisions(){
   float radius = 30 * size;
   if (xpos > width - radius) {
     speedX = -speedX;

     // When hitting right wall, turn to face backwards
     faceForward = false;
    }

    if (xpos < radius) {
      speedX = -speedX;
    
      // When hitting left wall, turn to face forwards
      faceForward = true;
    }
  
    if (ypos > height - 450 - radius) {
      speedY = -speedY;
    }
  
    if (ypos < radius) {
      speedY = -speedY;
    }
  }
  
  // Is this bird a (the) bomber?
  boolean isBomber() {
    return species.equals(Species.BOMBER);
  }
  
  // Make birds poop votes
    // if bird position crosses x of candidate, bird poops white oval.
  // Birds poop at random times - given iowa caucus votes.
  // First check party, check candidate - determine color, then check number votes ==> POOP number of votes in column
  // candidate (width, height)
    //for (TableRow row : table.rows()) {
      //if (party = "Candidate");
        //println("print");
}
        
  
//}