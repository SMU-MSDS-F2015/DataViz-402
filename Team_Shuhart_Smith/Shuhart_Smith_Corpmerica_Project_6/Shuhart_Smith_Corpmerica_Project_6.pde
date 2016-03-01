USMap map;
StockChart chart;

void setup(){
  size(600, 1000);
  map = new USMap(this);
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
  float[] prices = getPrices("msft");
  println(prices.length);
  prices = getApplePrices();
  println(prices.length);
  chart.loadData(prices);
}