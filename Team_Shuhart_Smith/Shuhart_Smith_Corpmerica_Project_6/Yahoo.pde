class DataYahoo {

  //Properties, Attributes, Fields
  //Table priceTable;
  String symbol;
  float[] closingPrices = {};
  

  //Constructors 
  DataYahoo() {
  }

  DataYahoo(String symbol) {
    this.symbol = symbol;
  }


  //Methods and Functions
  float[] closingPrices(String symbol) {
    // Load data from Yahoo finance via HTML location.
    // HTML location is a string with the symbol variable 
    // concantenated in to the address.
    String startYr = "2015";
    String priceData = "http://real-chart.finance.yahoo.com/table.csv?s=" +
      symbol + "&d=2&e=1&f=2016&g=d&a=11&b=1&c=" +
      startYr + "&ignore=.csv";

    // Load date of symbol from Yahoo Finance
    Table priceTable;
    priceTable = loadTable(priceData, "header");

    // Iterates through 
    for (TableRow row : priceTable.rows()) {
      float price = row.getFloat("Close");
      closingPrices = append(closingPrices, price);
    }
    return closingPrices;
  }
}