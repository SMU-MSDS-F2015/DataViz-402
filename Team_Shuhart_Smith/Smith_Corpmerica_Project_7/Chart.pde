import org.gicentre.utils.stat.*;  

abstract class Chart {
  boolean hasData = false;
  DateDataPoint[] dataPoints;
  String title;
  XYChart lineChart;
  String source;
  String yUnits;
  String xUnits;
 
  // Default constructor -- used with no symbol in initial setup
  Chart() {
  }
 
  Chart(PApplet sketchWindow, String stateCode) {
    lineChart = new XYChart(sketchWindow);
  }

  void setData() {
    if (this.hasData) {
      lineChart.setData(this.getDateIds(), this.getDailyValues());
    }
  }

  float[] getDailyValues() {
    println(dataPoints.length);
    float[] values = new float[dataPoints.length];
    for(int i = 0; i < dataPoints.length; i++) {
      println(i);
      println(dataPoints[i]);
      values[i] = dataPoints[i].dailyValue;
    }
    
    return values;
  }

  float[] getDateIds() {
    float[] dates = new float[dataPoints.length];
    for(int i = 0; i < dataPoints.length; i++) {
      //dates[i] = quotes[i].closingDateId;
      dates[i] = i - dataPoints.length;
    }

    return dates;
  }
    
  void draw() {

    // If data hasn't been loaded for stock, exit
    if (this.hasData == false) {
      return;
    }
      
    // Set the chart attributes
    //lineChart.showXAxis(true); 
    lineChart.showYAxis(true); 
    lineChart.setPointColour(color(180,50,50,100));
    lineChart.setPointSize(5);
    lineChart.setLineWidth(2);

    // Set the Axes labels
    lineChart.setXAxisLabel(xUnits);
    lineChart.setYAxisLabel(yUnits);

    // Draw the chart, based on size of the window.
    lineChart.draw(30, height / 2 + 30,width - 60, height / 2 - 60); 

    // Print the Title
    fill(100, 0, 100);
    textSize(int(width /30));
    textAlign(CENTER);
    text(this.title , width / 2 ,height / 2 + height / 30 + 10);
 
    // Print the Footnote
    fill(0, 20, 50);
    textSize(11);
    text("Source: " + source, width - 4 * source.length() ,height - 10);
  }
}