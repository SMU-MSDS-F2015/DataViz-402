// SMU Data Science Program
// MSDS 6390-402 Visualization of Information
// Assignment #3: Dynamic Composition 1
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

// Track the inputNumber for allowing changing number of birds on the fly
String inputNumber = "";

// Array to hold each of the birds
Bird[] birds;

String[] imgs = new String[]{"2016_election.jpg"};
PImage[] images = new PImage[imgs.length];

//PImage img01, img02, img03, img04;
void setup(){
  size(1000,800);
  
  int idx = 0;
  for(String filePath: imgs) {
    images[idx] = loadImage(filePath);
    images[idx].resize(1000, 450);
    image(images[idx], 0, 0);
    
    idx++;
  }
  
  createBirds(); 
}

void draw(){
  //Clear previous frame, adjust background to sky blue
  background(62, 109, 170);
  
  //image(img01,0,0);
  for(PImage tmp_image: images) {
    image(tmp_image, 0, height - 495);
  }
  
  // Draw each bird in turn
  for (int i = 0; i < birdCount; i += 1)  {
    birds[i].drawBird();
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
  birds = new Bird[birdCount];
  for ( int i = 0; i < birdCount; i++)  {
    birds[i] = new Bird();    
  }
}