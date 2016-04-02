Controller controller;

void setup(){
  size(1000,1000);
  controller = new Controller(this);
}

void draw(){
  controller.draw();
}
  
void mousePressed(){
  controller.handleMousePress();
}