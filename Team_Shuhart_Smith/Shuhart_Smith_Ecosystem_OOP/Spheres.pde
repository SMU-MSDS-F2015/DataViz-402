//http://rapidtables.com/web/color/RGB_Color.htm

import processing.opengl.*;

//Due to the extreme differences of offspring size, the values have been scale by the natuarl log 
float[] sphereSizeLN = {7.60090246, 13.81551056, 1.098612289, 0.009950331, 1.609437912, 4.605170186, 5.703782475, 9.210340372, 9.210340372}; 
String[] sphereNames = {"Bass","Cod","Lion","Bat","Dog","Dragonfly","Moth","Oak","Maple"};
PVector[] vecs = new PVector[sphereSizeLN.length];
int[] positions = new int[sphereSizeLN.length];


boolean proceed = false;


void drawSpheres(int[] positions, float[] sphereSizeLN) {
//    rotateY(radians(frameCount));
   
//    noFill();
//    strokeWeight(1);
//    box(dim);
   
    //translate(-dim/2,-dim/2,-dim/2);
    for (int i=0; i<vecs.length; i++) {
      vecs[i].y = positions[i];
      PVector v = vecs[i];
      stroke(255,75);
      strokeWeight(2);
      //line(v.x,0,v.z,v.x,v.y,v.z);
      pushMatrix();
      translate(v.x,v.y,v.z);
      //TODO: add colors and legend by species
      fill(250, 100, 100);
      sphere(sphereSizeLN[i]*10); //Multiplied by 10 to make it a little bigger
      popMatrix();
      delay(100);
    }
}