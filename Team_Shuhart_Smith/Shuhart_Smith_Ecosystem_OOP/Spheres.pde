//http://rapidtables.com/web/color/RGB_Color.htm

import processing.opengl.*;

PVector[] vecs = new PVector[10];
int dim = 1000;

boolean proceed = false;


void drawSpheres() {
   if (proceed) { // Right now, only draw once the mouse is clicked. TODO: draw on top of the landscape/remove the background black-out
     
    //background(0);
    translate(width/2,height/2);
//    scale(1,-1,1); // so Y is up, which makes more sense in plotting
//    rotateY(radians(frameCount));
   
//    noFill();
//    strokeWeight(1);
//    box(dim);
   
    translate(-dim/2,-dim/2,-dim/2);
    for (int i=0; i<vecs.length; i++) {
      vecs[i].y = noise(frameCount * 0.005 + i) * dim;
      PVector v = vecs[i];
      stroke(255,75);
      strokeWeight(10);
      line(v.x,0,v.z,v.x,v.y,v.z);
      pushMatrix();
      translate(v.x,v.y,v.z);
      //TODO: add colors and legend by species
      fill(250, 100, 100);
      sphere(20);
      popMatrix();
    }
  }
}