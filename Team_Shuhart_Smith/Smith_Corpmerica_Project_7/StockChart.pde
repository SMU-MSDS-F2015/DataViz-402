class StockChart extends Chart {
 
  // Default constructor -- used with no symbol in initial setup
  StockChart() {
  }
 
  StockChart(PApplet sketchWindow, String symbol, String company) {
    super(sketchWindow, "TBD");
    println(symbol);
    DataYahoo yahoo = new DataYahoo();
    dataPoints = yahoo.closingQuotes(symbol);
    this.hasData = true;
    this.title = "Stock Prices for " + company + "(" + symbol + ")";
    super.title = title;
    super.setData();
  }
  
}