// SMU Data Science Program
// MSDS 6390-402 Visualization of Information
// Assignment #4: Dynamic Composition II
// Ryan Shuhart
// Adrienne Smith
// RJ Smith

// This program will show N number of birds flying about the sky (screen) in an
// animated fashion. The number of birds is dynamic, and the user can change
// the number during execution, at which point the composition will be adjusted
// with a new set of birds.

// There is a global array of Bird class, setup function which creates the birds,
// and draw function that calls the drawbird of each bird in the collection.

// After drawing, each bird is moved, and if collision with edge of windows is 
// detected, angle of flight is modified to reflect off the wall.

// There are 4 species of bird that vary by color/size, and is species is chosen at random
// Canary
// Cardinal
// Bluebird
// Crow

// Initially, set number of birds to 20
int birdCount = 20;

// The image file to display on background
final String imageFileName = "2016_election.jpg";
PImage backgroundImage;

// Track the inputNumber for allowing changing number of birds on the fly
String inputNumber = "";

// Array to hold each of the birds
Flock birds;

void setup(){
  size(1000,600);
  
  backgroundImage = loadImage(imageFileName);
  backgroundImage.resize(width, height);

  createBirds(); 
}

void draw(){

  image(backgroundImage, 0, 0);
  
  // Draw each bird in turn
  for (int i = 0; i < birdCount; i += 1)  {
    // The bomber will internally handle poop governance
    birds.get(i).drawBird();
  }
}

// Allow the user to change the number of birds
void keyPressed(){
  
  // Get the keypress, and if a number, append to the inputNumber
  if( key >= '0' && key <= '9' ){
   inputNumber += key; 
  }
  
  // On hitting enter/return, adjust the number of birds to the count
  if( key == ENTER || key == RETURN ){
    if (birdCount >= 0) {
      birdCount = int(inputNumber);
      inputNumber = "";
      println("Changing the number of birds to " + birdCount);
      createBirds();
    }
  }
}

// Create the birds, based on the birdCount
void createBirds() {
  birds = new Flock(birdCount);
}