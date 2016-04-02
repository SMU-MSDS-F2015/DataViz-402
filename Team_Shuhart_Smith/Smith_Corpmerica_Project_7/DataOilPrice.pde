//West Texas Crude Continuous Contract Daily Price
processing.data.Table oilDaily;
processing.data.Table oilMonthly;

void oilDaily() {
  oilDaily = loadTable("oil_daily_price.csv", "header");
  int i=0;
  println("Date\t\tClose_Value");
  for (TableRow row : oilDaily.rows()) {
    //int t = oilDaily.getRowCount() - 1 - i;
    println(row.getString("Date") + "\t\t" + row.getString("Settle") );
    i++;
  }
}

void oilMonthly() {
  oilMonthly = loadTable("oil_month_closing_price.csv", "header");
  int i=0;
  println("Date\t\tClose_Value");
  for (TableRow row : oilMonthly.rows()) {
    //int t = oilMonthly.getRowCount() - 1 - i;
    println(row.getString("Date") + "\t\t" + row.getString("Settle") );
    i++;
  }
}