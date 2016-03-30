Corpmerica myApp;
processing.data.Table stateOil;

void setup(){
bls_stuff();

  stateOil =  loadTable("state_oil_production.csv", "header");
  
  size(1000,1000);
  myApp = new Corpmerica(this);
}

void draw(){
  myApp.draw();
}
  
void mousePressed(){
  myApp.handleMousePress();
}