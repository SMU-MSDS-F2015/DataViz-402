import geomerative.*;

class USMap {
  RShape map;
  String currentState;

  USMap(PApplet parent) {
    RG.init(parent);
    smooth();
    RG.setPolygonizer(RG.ADAPTATIVE);
    RG.ignoreStyles(true);
    map = RG.loadShape("usmap.svg");
    map.transform(0,0,600,600);
    //map.centerIn(g, 100, 1, 1);
  }
  
  void draw() {
    //translate(width/2, height/2);
    background(255);
    stroke(0);
    noFill();
    map.draw();
    RPoint mousePosition = new RPoint(mouseX, mouseY);
    for(RGeomElem state : map.children) {
      if(state.contains(mousePosition)){
         currentState = state.name.toUpperCase();
         fill(0,100,255,250);
         noStroke();
         state.draw();
      }
    }
  }
}