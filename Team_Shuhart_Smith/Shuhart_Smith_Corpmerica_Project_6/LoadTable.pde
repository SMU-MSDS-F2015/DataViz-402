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
  }
}