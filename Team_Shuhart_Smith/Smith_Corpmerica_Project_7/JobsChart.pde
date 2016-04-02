class JobsChart extends Chart {
 
  // Default constructor -- used with no symbol in initial setup
  JobsChart() {
  }
 
  JobsChart(PApplet sketchWindow, String stateCode) {
    super(sketchWindow, "TBD");
    
    DataBls bls = new DataBls();
    println("in jobchart for statecode");
    dataPoints = bls.getBlsForStateCode(stateCode);
    println("in JobChart");
    println(dataPoints.length);
    if (dataPoints[0] != null) {
      this.hasData = true;
    }
    
    this.title = "2015 Oil Industry Jobs Count for " + stateCode;
    super.title = title;
    super.xUnits = "Months";
    super.yUnits = "Jobs (Thousands)";
    this.source = "Bureau of Labor & Statistics";
    super.setData();
  }
  
}