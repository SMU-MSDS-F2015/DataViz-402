// The ecosystem should be globally accessible by all, so declaring it here
Ecosystem ecosystem;

void setup() {
  size(1500, 800, P3D);

  ecosystem = new Ecosystem();
  drawit();
}

void draw() {
  image(background, 0, 0);
  ecosystem.simulate();
  drawSpheres(positions, sphereSizeLN, sphereColors, sphereX, sphereY, sphereNames);
}