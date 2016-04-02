class JobsChart extends Chart {
 
  // Default constructor -- used with no symbol in initial setup
  JobsChart() {
  }
 
  JobsChart(PApplet sketchWindow, String stateCode) {
    super(sketchWindow, "TBD");
    
    DataBls bls = new DataBls();
    dataPoints = bls.getBlsForStateCode(stateCode);
    if (dataPoints[0] != null) {
      this.hasData = true;
    }
    
    this.title = "2015 Oil Industry Jobs Count for " + stateCode;
    this.xUnits = "Month in 2015";
    this.yUnits = "Jobs (Thousands)";
    this.source = "Bureau of Labor & Statistics";
    this.position = 0; //Jobs in position 1, move this to controller as appropriate
    super.setData();
  }
  
}