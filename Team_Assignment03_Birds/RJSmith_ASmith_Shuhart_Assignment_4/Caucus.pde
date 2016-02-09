class Caucus {
    ArrayList<Delegate> loadData() {

    Table table = loadTable("iowa.csv", "header");
    ArrayList<Delegate> delegates = new ArrayList<Delegate>();
        
    println(table.getRowCount() + " total rows in table"); 
  
    //String[] canList = {};
    //String[] partyList = {};
    //float[] pctList = {};
  
    for (TableRow row : table.rows()) {
  
      String candidate = row.getString("Candidate");
      String party = row.getString("Party");
      Float pct = row.getFloat("Percent");
      int delegateCount = int(row.getFloat("Delegates"));
      
      for(int i = 0; i < delegateCount; i++) {
        Delegate delegate = new Delegate(party, candidate);
        delegates.add(delegate);
      }
  
      println(candidate + " (" + party + ") earned " + pct + " of the delegates");
    }
    
    return delegates;
  }
}