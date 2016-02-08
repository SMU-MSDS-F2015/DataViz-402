// Main class that hold bird properties, as well as drawing the bird.
class Bird {
  float size;
  float xpos;
  float ypos;
  float speedX;
  float speedY;
  boolean faceForward;
  int speciesNumber;

  // Constructor. Randomly set up the bird properties.
  Bird() {
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
    speciesNumber = floor(random(1, 5));

    // Set the direction bird faces based on its travel direction
    if (speedX > 0) {
      faceForward = true;
    }
    else {
      faceForward = false;
    }
  }

  // Draw the bird, move it, and check for collison with edge
  void drawBird() {

    // Set the fill, based on bird color
    // This also sets the size, which varies by the color (i.e. bird species)
    setSpecies();
    
    // Draw the wings
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

// Set the bird color. Also, depending on the bird, set its size
void setSpecies() {
  switch(speciesNumber) {

    // Cardinal is red and slightly larger size;
    case 1:
      fill(150, 0, 0);
      size = 1.3;
      break;

    // Canary is yellow and small size;
    case 2:
      size = 0.6;
      fill(255, 255, 0);
      break;

    // Bluebird is normal size;
    case 3:
      size = 1;
      fill(0, 0, 150);
      break;

    // Crow is black and larger size;
    default :
      size = 1.6;
      fill(0);
      break;
  }
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
}