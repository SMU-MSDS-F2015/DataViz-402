// For those classes that we can chart via bar chart, they need to implement the following:

interface IChartable {
  String[] GetCategories();
  int[] GetCounts();
}