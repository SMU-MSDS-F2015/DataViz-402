class StateData {
  
  StringDict stateSymbol = new StringDict();
  StringDict stateCompany = new StringDict();

  // Constructor will load in the data from the file
  StateData() {  
    // Data of Stock Symbols, Names, and HQ States

    processing.data.Table symTable;
    
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
    }
  }
  
  boolean isStateMapped(String stateName) {
    return stateSymbol.hasKey(stateName);
  }
  
  String getStateSymbol(String stateName) {
    return stateSymbol.get(stateName);
  }
  
  String getStateCompany(String stateName) {
    return stateCompany.get(stateName);
  }
}