import org.gicentre.utils.stat.*;  

class StockChart {
  StockQuote[] quotes;
  String company;
  String symbol;
  XYChart lineChart;
 
  // Default constructor -- used with no symbol in initial setup
  StockChart() {
  }
 
  StockChart(PApplet sketchWindow, String symbol, String company) {
    DataYahoo yahoo = new DataYahoo();
    quotes = yahoo.closingQuotes(symbol);
    this.company = company;
    this.symbol = symbol;
    lineChart = new XYChart(sketchWindow);
    lineChart.setData(this.getDateIds(), this.getPrices());
  }
  
  float[] getPrices() {
    float[] prices = new float[quotes.length];
    for(int i = 0; i < quotes.length; i++) {
      prices[i] = quotes[i].closingPrice;
    }
    
    return prices;
  }

  float[] getDateIds() {
    float[] dates = new float[quotes.length];
    for(int i = 0; i < quotes.length; i++) {
      //dates[i] = quotes[i].closingDateId;
      dates[i] = i - quotes.length;
    }

    return dates;
  }
    
  void draw() {

    // If data hasn't been loaded for stock, exit
    if (this.symbol == null) {
      return;
    }
      
    // Set the chart attributes
    lineChart.showXAxis(true); 
    lineChart.showYAxis(true); 
    lineChart.setPointColour(color(180,50,50,100));
    lineChart.setPointSize(5);
    lineChart.setLineWidth(2);

    // Set the Axes labels
    lineChart.setXAxisLabel("Business Days Ago");
    lineChart.setYAxisLabel("Closing Price");

    // Draw the chart, based on size of the window.
    lineChart.draw(30, height / 2 + 30,width - 60, height / 2 - 60); 

    // Print the Title
    fill(100, 0, 100);
    textSize(int(width /30));
    textAlign(CENTER);
    text("Stock Prices for " + this.company + "(" + this.symbol + ")" , width / 2 ,height / 2 + height / 30 + 10);
 
    // Print the Footnote
    fill(0, 20, 50);
    textSize(11);
    text("Source: Yahoo Finance", width - 70 ,height - 10);
  }
}