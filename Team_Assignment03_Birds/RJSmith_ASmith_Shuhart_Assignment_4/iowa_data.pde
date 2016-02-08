//Imports Iowa results data from csv.
Table table;

void iowa() {

  table = loadTable("iowa.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  String[] canList = {};
  String[] partyList = {};
  float[] pctList = {};
  
  for (TableRow row : table.rows()) {

    String can = row.getString("Candidate");
    String party = row.getString("Party");
    Float pct = row.getFloat("Percent");

    canList = append(canList,row.getString("Candidate"));
    partyList = append(partyList, row.getString("Party"));
    pctList = append(pctList, row.getFloat("Percent"));

    println(can + " (" + party + ") earned " + pct + " of the delegates");
  }
  
  printArray(pctList);
}