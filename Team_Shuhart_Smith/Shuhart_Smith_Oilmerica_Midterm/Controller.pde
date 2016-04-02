class Controller {
  PApplet sketchWindow; // Track the parent windows for passing to children

  StateData states;     // Keep track of the state data and companies
  USMap map;            // 
  JobsChart jobsChart;
  OilPriceChart oilPriceChart;

  Controller(PApplet sketchWindow) {
    
    // Track the parent window to pass to children
    this.sketchWindow = sketchWindow;

    // Set the window size and make it resizeable
    surface.setSize(600, 800);
    surface.setResizable(true);
    
    // Create the ticker to track/graph the stock for a given state
    jobsChart = new JobsChart();
    oilPriceChart = new OilPriceChart();
    
    // Create the US map and load from SVG
    map = new USMap(sketchWindow);
  }
  
  void draw() {
    // Draw the map, then ticker
    map.draw();
    jobsChart.draw();
    oilPriceChart.draw();
  }
  
  void handleMousePress() {
 
    // Get the company/stock chart for the given state
    if (map.isStateSelected()) {
      jobsChart = new JobsChart(sketchWindow, map.currentState);
      oilPriceChart = new OilPriceChart(sketchWindow);
    }
  }
}