Corpmerica myApp;

void setup(){


  size(1000,1000);
  myApp = new Corpmerica(this);
}

void draw(){
  myApp.draw();
}
  
void mousePressed(){
  myApp.handleMousePress();
}