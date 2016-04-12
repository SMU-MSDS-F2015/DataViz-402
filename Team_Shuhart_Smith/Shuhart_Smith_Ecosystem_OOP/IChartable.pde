// For those classes that we can chart via bar chart, they need to implement the following:

interface IChartable {
  String[] getCategories();
  float[] getValues();
  void drawChart(PApplet sketchWindow);
}