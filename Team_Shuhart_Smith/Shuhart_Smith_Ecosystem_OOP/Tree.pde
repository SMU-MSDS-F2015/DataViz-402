
// There are oak and maple trees. They don't grow in the lakes, but are found in parks, zoos.
class Tree extends Plant {

  float theta, subTheta; 
  float treeMax = 250.0;
  PImage p;
  
    // Below adapted from tree_landscape example:
    // The Nature of Code
    // Daniel Shiffman
    // http://natureofcode.com
  
  void draw() {
    background(50, 150, 220);
    p = loadImage("landscape.jpg");
    
    pushMatrix();
    translate(width/2, height, 0);
    //rotateX(PI/.1);
    lights();
    fill(140, 100, 50);
    //box(width*4, 1, 6000);
    beginShape();
    //normal(0, 1, 0);
    fill(255);
    textureMode(NORMAL);
    texture(p);
    normal(0, 0, -1);
    vertex(-5000, 0, 100, 0, 0);
    vertex(5000, 0, 100, 1, 0);
    vertex(5000, 0, -6000, 1, 1);
    vertex(-5000, 0, -6000, 0, 1);
    endShape();
    popMatrix();
  
    theta = subTheta = 0.0;
  
    // Start the tree from the bottom of the screen
    translate(90, height);
  
    stroke(255);
    noFill();
  
    for (int i=0; i<5; i++) { //Change tree quantity here
      pushMatrix();
      translate(-width/2+i*50, 20, random(-5000, -100));
      tree(treeMax);
      popMatrix();
    }
    textSize(50);
    text("Offspring Size by Creation",-44, -750, 0);
    //Save rendering to buffer
    background = get();
  }
  
  
  void tree(float treeSize) {
    branch(treeSize);
  }
  
  void branch(float len) {
    // Each branch will be 2/3rds the size of the previous one
  
    float sw = map(len, 2, treeMax, .1, 15);
    strokeWeight(sw);
  
    //line(0, 0, 0, -len);
    beginShape();
    curveVertex(0, 0);
    curveVertex(0, 0);
    if (len>4) {
      stroke(50, 20, 10);
      curveVertex(-random(2, 4), -len/2*random(.55, .75));
      curveVertex(random(1, 2), -len/2);
      curveVertex(-random(2, 4), -len/2*random(1.35, 1.65));
    } else {
      stroke(random(50, 145), random(70, 185), random(10, 20));
    }
    curveVertex(0, -len);
    curveVertex(0, -len);
    endShape();
  
    translate(0, -len);
  
    len *= random(.5, .75);
    float totalSpanAngle = random(25.0, 45);
    float subBranches = round(random(2, 4));
    if (len > 2) {
      theta = radians(totalSpanAngle/2.0);
      subTheta = radians(totalSpanAngle/(subBranches-1));
  
      for (int i=0; i<subBranches; i++) {
        pushMatrix();    // Save the current state of transformation (i.e. where are we now)
        //var t = -theta + subTheta;
        rotate(-theta + random(subTheta*i*.85, subTheta*i*1.15));
        branch(random(len*.75, len*1.25));       // Ok, now call myself to draw two new branches!!
        popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
      }
    }
  }


}

class Oak extends Tree  implements IHasSeeds {

  boolean doIReproduce() {return true;}
  
  OakSeed[] produceOffspring() {
    OakSeed[] offspring = new OakSeed[2];
    for(int i=0; i <2; i++) {
      offspring[i] = new OakSeed();
    }    return offspring;
  }

}
class Maple extends Tree implements IHasSeeds {
  boolean doIReproduce() {return true;}
  
  MapleSeed[] produceOffspring() {
    MapleSeed[] offspring = new MapleSeed[3];
    for(int i=0; i <3; i++) {
      offspring[i] = new MapleSeed();
    }
    return offspring;
  }
}