// The ecosystem should be globally accessible by all, so declaring it here
Ecosystem ecosystem;
Spheres spheres;
PImage background;

void setup() {
  size(1500, 800, P3D);

  ecosystem = new Ecosystem();
  spheres = new Spheres();
  Tree tree = new Tree();
  tree.draw();
}

void draw() {
  image(background, 0, 0);
  ecosystem.simulate();
  spheres.drawSpheres();
}