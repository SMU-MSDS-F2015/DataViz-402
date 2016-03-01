USMap map;
StockChart chart;

void setup(){
  size(600, 1000);
  map = new USMap(this);
  setupData();
  chart = new StockChart("MSFT", "Microsoft, Corp.");
}

void draw(){
  map.draw();
  if (chart.loaded) {
    chart.draw(25, 400);
  }
}
  
void mousePressed(){
  println(map.currentState);
  String symbol = stateSymbol.get(map.currentState);
  String company = stateCompany.get(map.currentState);
  float[] prices = getPrices(symbol);
  chart = new StockChart(symbol, company);
  println(prices.length);
  println(prices[209]);
  chart.loadData(prices);
}