USMap map;
StockChart chart;
StateData states;
DataYahoo yahoo = new DataYahoo();

void setup(){
  size(600, 800);
  // Create the US map and load from SVG
  map = new USMap(this);

  // Load in the company data and set the state/company mappings
  states = new StateData();

  // Create the stock chart--default to MSFT, but will get set before being displayed
  chart = new StockChart("MSFT", "Microsoft, Corp.");
}

void draw(){

  // Draw the map
  map.draw();

  // If data has been loaded for stock, display chart, else keep hidden
  if (chart.loaded) {
    chart.draw(25, 400);
  }
}
  
void mousePressed(){
  String state = map.currentState;
  // Get the company/stock symbol for the given state
  if (state != "none" && states.isStateMapped(state)) {
    String symbol = states.getStateSymbol(state);
    String company = states.getStateCompany(state);
  
    // Get the closing prices for the given stock
    float[] prices = yahoo.closingPrices(symbol);
  
    // Draw the stock chart for the given symbol/prices
    chart = new StockChart(symbol, company);
    chart.loadData(prices);
  }
}