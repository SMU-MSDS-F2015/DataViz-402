//https://processing.org/reference/loadTable_.html
//https://processing.org/tutorials/data/

processing.data.Table priceTable;
processing.data.Table symTable;

String sym;
String startYr = "2016";  // Set for 2016 for year to date data only. Doesn't need to be YTD
String[] coSymList = {};
String[] coNameList = {};  
String[] coStateList = {};

StringDict stateSymbol = new StringDict();
StringDict stateCompany = new StringDict();

void setupData() {  
  // Data of Stock Symbols, Names, and HQ States
  String symData = "CoList.csv";
  symTable = loadTable(symData, "header");

  // Creates an array of all the states, symbols, and names
  for (TableRow row : symTable.rows()) {    
    String state = row.getString("state");
    String coSym = row.getString("coSymbol");
    if(!stateSymbol.hasKey(state)) {
      stateSymbol.set(state, coSym);
    }
      
    String coName = row.getString("coName");
    if(!stateCompany.hasKey(state)) {
      stateCompany.set(state, coName);
    }
    
    coSymList = append(coSymList, coSym);
    coNameList = append(coNameList, coName);
    coStateList = append(coStateList, coSym);

    //println(coSym + "\t\t" + coName + "\t\t" + state);
  }
}

float[] getPrices(String sym) {

  int i = 0;
  //sym = coSymList[i];  

  // Load data from Yahoo finance via HTML location.
  // HTML location is a string with the symbol variable 
  // concantenated in to the address.
  String priceData = "http://real-chart.finance.yahoo.com/table.csv?s=" +
    sym + "&d=2&e=28&f=2016&g=d&a=1&b=28&c=2015&ignore=.csv";
  
  // Load date of symbol from Yahoo Finance
  priceTable = loadTable(priceData, "header");
  println(priceData);

  // More for visual confirmation data is working
  // Print Company name column names with two tabs in the middle 
  //println(coNameList[i]);
  println("Date"+"\t\t"+"Close Price");

  // Iterates through and prints each row of Date and Close 
  // separeated by two tabs
  float[] prices = new float[priceTable.getRowCount()];
  i = 0;
  for (TableRow row : priceTable.rows()) {
   int t = priceTable.getRowCount() - 1 - i;
   prices[t] = row.getFloat("Close");  
   println(row.getString("Date")+ "\t\t" + row.getFloat("Close"));
   i++;
  }
  //for (int n = 0; n < priceTable.rows().length; n++) {
  //  prices[i] = row.getFloat("Close");
  //  println(row.getString("Date")+ "\t\t" + row.getFloat("Close"));
  //  i++;
  //}  
  return prices;
}