// The ecosystem should be globally accessible by all, so declaring it here
Ecosystem ecosystem;
BarChart barChart;

float theta, subTheta; 
float treeMax = 250.0;
PImage p;
PImage background;

void setup() {
  // Start the ecosystem here. TODO: adapt the ecosystem to draw()
  ecosystem = new Ecosystem();

  for (int i=0; i<vecs.length; i++) {
    vecs[i] = new PVector(random(width), random(height/2), 0);
  }


  // Below adapted from tree_landscape example:
  // The Nature of Code
  // Daniel Shiffman
  // http://natureofcode.com

  size(1500, 800, P3D);
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

void draw() {
  image(background, 0, 0);
  
  for (int i=0; i < positions.length; i++) {
    positions[i] = int(random(150,700));//int(random(200, 800));
  }

  ecosystem.simulate();

  drawSpheres(positions, sphereSizeLN, sphereColors, sphereX, sphereY, sphereNames);
}

void mousePressed() {
  proceed = true;
}