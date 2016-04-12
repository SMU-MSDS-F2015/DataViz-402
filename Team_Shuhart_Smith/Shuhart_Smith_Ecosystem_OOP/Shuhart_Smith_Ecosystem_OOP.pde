// The ecosystem should be globally accessible by all, so declaring it here
Ecosystem ecosystem;
BarChart barChart;

void setup() {
  size(1000, 700);
  Ecosystem ecosystem = new Ecosystem();
  ecosystem.drawChart(this);
}