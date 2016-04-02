class DataOilPrice {
  processing.data.Table oilDaily;
  processing.data.Table oilMonthly;
  
  DataOilPrice() {
    oilMonthly = loadTable("oil_month_closing_price.csv", "header");
    oilDaily = loadTable("oil_daily_price.csv", "header");
  }
  
  DateDataPoint[] getMonthlyPrices() {
    DateDataPoint[] prices = new DateDataPoint[12]; // BLS data is only for 1 year
    int i = 0;

    // Iterates through dates, and pull the price into the array to return
    for (TableRow row : oilMonthly.rows()) {
      int t = oilMonthly.getRowCount() - 1 - i; //fill backwards
      prices[t] = new DateDataPoint(row.getString("Date"), row.getFloat("Last")); // fill forwards
      i++;
    }
      
    return prices;
  }
}

//void oilDaily() {
//  int i=0;
//  println("Date\t\tClose_Value");
//  for (TableRow row : oilDaily.rows()) {
//    //int t = oilDaily.getRowCount() - 1 - i;
//    println(row.getString("Date") + "\t\t" + row.getString("Settle") );
//    i++;
//  }
//}