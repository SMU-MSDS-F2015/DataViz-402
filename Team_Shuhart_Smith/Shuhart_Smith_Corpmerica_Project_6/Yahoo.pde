import java.util.*;
import java.text.*;

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

    Date endDate = new Date();
    Calendar calendar = new GregorianCalendar();
    calendar.setTime(endDate);
    calendar.add(Calendar.MONTH, -14);
    Date startDate = calendar.getTime();
    
    SimpleDateFormat startFormat = new SimpleDateFormat ("'&g=d&a='M'&b='d'&c='y'&ignore=.csv'");
    SimpleDateFormat endFormat = new SimpleDateFormat ("'&d='M'&e='d'&f='y");
    String queryString = "http://real-chart.finance.yahoo.com/table.csv?s=" + symbol
        + endFormat.format(endDate) + startFormat.format(startDate);
        

    // Load date of symbol from Yahoo Finance
    processing.data.Table priceTable;
    priceTable = loadTable(queryString, "header");

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