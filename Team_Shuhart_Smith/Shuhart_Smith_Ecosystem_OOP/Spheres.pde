//http://rapidtables.com/web/color/RGB_Color.htm

import processing.opengl.*;

PVector[] vecs = new PVector[10];
int dim = 1000;

boolean proceed = false;


void drawSpheres() {
   if (proceed) {

     
     
    background(0);
    translate(width/2,height/2);
    scale(1,-1,1); // so Y is up, which makes more sense in plotting
//    rotateY(radians(frameCount));
   
    noFill();
    strokeWeight(1);
//    box(dim);
   
    translate(-dim/2,-dim/2,-dim/2);
    for (int i=0; i<vecs.length; i++) {
      vecs[i].y = noise(frameCount * 0.005 + i) * dim;
      PVector v = vecs[i];
      stroke(255,75);
      strokeWeight(10);
      line(v.x,0,v.z,v.x,v.y,v.z);
      color(random(255), random(255), random(255), random(255));
      pushMatrix();
      translate(v.x,v.y,v.z);
      sphere(20);
      popMatrix();
    }
  }
}