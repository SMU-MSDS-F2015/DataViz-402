void GameOfLife() { //<>// //<>//
  for (TableRow row : currPop.rows()) {
    int adder=0;  //Total multiplier to reduce pop by
    String adjList = row.getString("AdjCountyList");
    String[] adj = split(adjList, "|");

    //Go through each adj. county.
    for (String s : adj) {
      try {
        TableRow r=prevPop.findRow(s, "ID");
        //println(s, adder, r.getInt("ConwayValue"));
        if (r.getInt("ConwayValue")==1) {
          adder++; //<>//
        }
      } 
      catch (NullPointerException e) {
        //Catch missing counties. Okay to ignore these.
      }
    }
   
    //Game of Life rules:
    row.setInt("ConwayValue", 1);
    if (adder<adj.length*0.2) { //under crowded
      row.setInt("ConwayValue", 0);
    } else if (adder>adj.length*0.6) {  //over crowded
      row.setInt("ConwayValue", 0); //<>//
    }
  } //<>//

  //Now, move currPop to prevPop, to save changes for next time.
  for (TableRow row : currPop.rows()) {
    String id=row.getString("ID");
    TableRow r=prevPop.findRow(id, "ID");
    r.setInt("ConwayValue", row.getInt("ConwayValue"));
  }
} // end class