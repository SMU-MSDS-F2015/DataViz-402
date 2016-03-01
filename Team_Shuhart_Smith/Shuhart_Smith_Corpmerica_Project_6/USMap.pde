// Use geomerative library for working with SVG map and states,
// helps to determine when mouse pointer is within state boundaries
import geomerative.*;

class USMap {
  RShape map;
  String currentState;
  
  // Set up the map using geomerative library and load the SVG from the file.
  USMap(PApplet parent) {
  RG.init(parent);
  smooth();
  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.ignoreStyles(true); // Ignore the styles in the SVG
  map = RG.loadShape("usmap.svg");

  // fit the map into 600 pixels to allow showing chart beneath
  map.transform(0,0,600,600);
  }
  
  void draw() {

    // Put the map on white background, and draw it
    background(255);
    stroke(0);
    noFill();
    map.draw();

    // Check to see if mouse is hovered over the state, and highlight accordingly
    currentState = "none";
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