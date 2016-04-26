//http://rapidtables.com/web/color/RGB_Color.htm

import processing.opengl.*;

PVector[] vecs = new PVector[10];
int[] positions = new int[10];

boolean proceed = false;


void drawSpheres(int[] positions) {
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
      sphere(20);
      popMatrix();
      delay(100);
    }
}