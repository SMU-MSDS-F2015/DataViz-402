class Corpmerica {
  PApplet sketchWindow; // Track the parent windows for passing to children

  StateData states;     // Keep track of the state data and companies
  USMap map;            // 
  StockChart chart;

  Corpmerica(PApplet sketchWindow) {
    
    // Track the parent window to pass to children
    this.sketchWindow = sketchWindow;

    // Set the window size and make it resizeable
    surface.setSize(600, 800);
    surface.setResizable(true);
    
    // Create the ticker to track/graph the stock for a given state
    chart = new StockChart();
    
    // Create the US map and load from SVG
    map = new USMap(sketchWindow);
  }
  
  void draw() {
    // Draw the map, then ticker
    map.draw();
    chart.draw();
  }
  
  void handleMousePress() {
 
    // Get the company/stock chart for the given state
    if (map.isStateSelected()) {
      chart = new StockChart(sketchWindow, map.getSymbol(), map.getCompany());
    }
  }
}