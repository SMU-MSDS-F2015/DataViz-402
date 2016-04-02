class DataOilProduction {
  processing.data.Table stateOil;
  
  DataOilProduction() {
    stateOil = loadTable("state_oil_production.csv", "header");
  }
  
  int getOilByStateCode(String stateCode) {
    int production = 0;
    if (stateOil.findRow(stateCode, 0) != null) {
      production = stateOil.findRow(stateCode, 0).getInt(1);
    }
    
    return production;
  }
}
  