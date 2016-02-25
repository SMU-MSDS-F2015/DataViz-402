// zombieLife calcluates the artifical life matrix //<>// //<>//
// rules:
// - Each adjacent county that's contaminated will reduce the current
//   county population by the multipler.
// - When a pop gets to 0 (or less), it's infected, and will contribute to
//   spreading.

void zombieLife() {
  for (TableRow row : currPop.rows()) {
    int subtract=0;  //Total multiplier to reduce pop by
    String adjList = row.getString("AdjCountyList");
    String[] adj = split(adjList, "|");

    //Go through each adj. county.
    for (String s : adj) {
      try {
        TableRow r=prevPop.findRow(s, "ID");
        if (r.getInt("Census")<=0) {
          subtract++;
        }
      } 
      catch (NullPointerException e) {
        //Catch missing counties. Okay to ignore these.
      }
    }

    int cpop = row.getInt("Census") ;  //Get particular row
    int killMultiplier = (popMultiplier*subtract);
    if (subtract>0 & cpop>0) {  //There is population to subtract
      if (killMultiplier>cpop) { //Can't kill more people than exist
        totalPopulation -= cpop;
        livesTaken += cpop;
        row.setInt("Census", 0);
      } else {  // pop is greater than multiplier
        totalPopulation -= killMultiplier;
        livesTaken += killMultiplier;
        int n= cpop - killMultiplier;
        row.setInt("Census", n);
      }
    }
  }

  //Now, move currPop to prevPop, to save changes for next time.
  for (TableRow row : currPop.rows()) {
    String id=row.getString("ID");
    TableRow r=prevPop.findRow(id, "ID");
    r.setInt("Census", row.getInt("Census"));
  }
} // end class