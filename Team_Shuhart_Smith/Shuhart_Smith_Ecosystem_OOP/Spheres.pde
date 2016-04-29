import processing.opengl.*;

// Sphere will now draw the 3D sphere that represents the size of the offspring for final project

class Spheres {

  //Due to the extreme differences of offspring size, the values have been scale by the natuarl log 
  float[] sphereSizeLN = {7.60090246, 13.81551056, 1.098612289, 0.5, 1.609437912, 4.605170186, 5.703782475, 9.210340372, 9.210340372};

  //http://rapidtables.com/web/color/RGB_Color.htm
  color[] sphereColors = {#a6cee3,#2ca25f,#b2df8a,#F3F315,#fb9a99,#e31a1c,#fdbf6f,#ff7f00,#cab2d6};
  int[] sphereX = {150,300,450,600,750,900,1050,1200,1350};
  int[] sphereY = {88,176,264,352,440,528,616,704,792,};
  String[] sphereNames = {"Bass","Cod","Lion","Bat","Dog","Dragonfly","Moth","Oak","Maple"};
  PVector[] vecs;
  int[] positions;
  
  Spheres() {
  
    vecs = new PVector[sphereSizeLN.length];
    positions = new int[sphereSizeLN.length];
  
    for (int i=0; i<vecs.length; i++) {
      vecs[i] = new PVector(random(width), random(height/2), 0);
    }
  }
  
  void drawSpheres() {
  
    for (int i=0; i < positions.length; i++) {
      positions[i] = int(random(150,700));//int(random(200, 800));
    }
  
      for (int i=0; i<vecs.length; i++) {
        vecs[i].y = positions[i];
        PVector v = vecs[i];
        noStroke();
        lights();
        pushMatrix();
        translate(sphereX[i],v.y,0);
        fill(sphereColors[i]);
        sphere(sphereSizeLN[i]*5); //Multiplied by 10 to make it a little bigger
        stroke(0);
        textSize(32);
        rectMode(RADIUS);
        textAlign(CENTER);
        text(sphereNames[i], 0,-max(sphereSizeLN)*5-10,0);
        popMatrix();
        delay(100);
      }
  }
}