import java.util.*;
import java.text.*;

class DataYahoo {

  // Just use the default constructor 
  DataYahoo() {
  }

  // Return the quotes at close for the give stock by calling into Yahoo API
  StockQuote[] closingQuotes(String symbol) {
    
    // Load data from Yahoo finance via HTML location.
    // HTML location is a string with the symbol variable 
    // concantenated in to the address.

    // Load data of symbol from Yahoo Finance
    processing.data.Table priceTable;
    priceTable = loadTable(buildQueryString(symbol), "header");

    // Add the closing prices in reverse order
    StockQuote[] closingQuotes = new StockQuote[priceTable.getRowCount()];
    int i = 0;

    // Iterates through dates, and pull the price into the array to return
    for (TableRow row : priceTable.rows()) {
      int t = priceTable.getRowCount() - 1 - i;
      closingQuotes[t] = new StockQuote(row.getString("Date"), row.getFloat("Close")); 
      i++;
    }
    
    return closingQuotes;
  }

  // Build the query string for Yahoo API for the given symbol
  // TODO: overload that will take given start/end dates
  String buildQueryString (String symbol) {

    // Default to today, and 14 months ago
    Date endDate = new Date();
    Calendar calendar = new GregorianCalendar();
    calendar.setTime(endDate);
    calendar.add(Calendar.MONTH, -14);
    Date startDate = calendar.getTime();
    
    SimpleDateFormat startFormat = new SimpleDateFormat ("'&g=d&a='M'&b='d'&c='y'&ignore=.csv'");
    SimpleDateFormat endFormat = new SimpleDateFormat ("'&d='M'&e='d'&f='y");
    String queryString = "http://real-chart.finance.yahoo.com/table.csv?s=" + symbol
        + endFormat.format(endDate) + startFormat.format(startDate);

    return queryString;
  }
}