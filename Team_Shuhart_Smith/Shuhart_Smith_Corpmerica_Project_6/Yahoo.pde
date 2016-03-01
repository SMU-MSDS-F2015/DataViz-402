class DataYahoo {

  //Properties, Attributes, Fields
  //Table priceTable;
  String symbol;
  
  StringDict stateSymbol = new StringDict();
  StringDict stateCompany = new StringDict();

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

    String priceData = "http://real-chart.finance.yahoo.com/table.csv?s=" + symbol
      + "&d=2&e=1&f=2016&g=d&a=11&b=1&c=2014&ignore=.csv";

    // Load date of symbol from Yahoo Finance
    processing.data.Table priceTable;
    priceTable = loadTable(priceData, "header");

    // Add the closing prices in reverse order
    float[] closingPrices = new float[priceTable.getRowCount()];
    int i = 0;

    // Iterates through 
    for (TableRow row : priceTable.rows()) {
      int t = priceTable.getRowCount() - 1 - i;
      closingPrices[t] = row.getFloat("Close"); 
      i++;
    }
    
    return closingPrices;
  }
}