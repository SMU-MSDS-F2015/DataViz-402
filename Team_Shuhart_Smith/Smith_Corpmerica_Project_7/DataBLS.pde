class DataBls {

  processing.data.Table blsData;
  
  DataBls() {
    blsData = loadTable("oil_jobs_data.csv", "header");
    }
  
  DateDataPoint[] getBlsForStateCode(String stateCode) {
    DateDataPoint[] jobs = new DateDataPoint[12]; // BLS data is only for 1 year
    int i = 0;

    // Iterates through dates, and pull the price into the array to return
    for (TableRow row : blsData.findRows(stateCode, "state_abbv")) {
      jobs[i] = new DateDataPoint(row.getString("Date"), row.getFloat("Value")); // fill forwards
      println(jobs[i].dateId + "\t" + jobs[i].dailyValue );
      i++;
    }
    println(i);
      
      return jobs;
  }
}