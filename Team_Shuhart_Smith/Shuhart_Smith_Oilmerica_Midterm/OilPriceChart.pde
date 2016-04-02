class OilPriceChart extends Chart {
 
  // Default constructor -- used with no symbol in initial setup
  OilPriceChart() {
  }
 
  OilPriceChart(PApplet sketchWindow) {
    super(sketchWindow, "TBD");
    
    DataOilPrice oilPrices = new DataOilPrice();
    dataPoints = oilPrices.getMonthlyPrices(); //Oil price is uniform across states
    if (dataPoints[0] != null) {
      this.hasData = true;
    }
    
    this.title = "2015 Oil Prices";
    super.title = title;
    super.xUnits = "Month in 2015";
    super.yUnits = "Dallars/Barrel";
    this.position = 1;
    this.source = "Quandl (www.quandl.com)";
    super.setData();
  }
  
}