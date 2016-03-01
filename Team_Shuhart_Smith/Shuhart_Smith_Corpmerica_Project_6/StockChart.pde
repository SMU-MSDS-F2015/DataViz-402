class StockChart {
  String title;
  int X1, Y1, X2, Y2;
  float[] price;
  float minPrice, maxPrice;
  boolean loaded = false;

  StockChart(String symbol, String companyName) {
    title = "(" + symbol + ") " + companyName;
  }
  
  void loadData(float[] price) {
    this.price = price;
    minPrice = min(price);
    maxPrice = max(price);
    loaded = true;
  }
  
  void draw(int x, int y) {
    X1 = 50;
    Y1 = 50;
    X2 = 500;
    Y2 = 200;
    translate(x, y);
    drawBorder();
    drawTitle();
    drawGraph(price, minPrice, maxPrice);
    movingAverage(price, minPrice, maxPrice, 25);
    drawXLabels();
    drawYLabels();
} // draw()

  void drawBorder() {
    rectMode(CORNERS);
    noStroke();
    fill(0);
    rect(X1 - 50, Y1 - 50, X2 + 50, Y2 + 50);
    fill(255);
    rect(X1, Y1, X2, Y2);
  }

  void drawTitle() {
    fill(255);
    textSize(18);
    textAlign(LEFT);
    text(title, X1, Y1 - 10);
  }

  void drawGraph(float[] data, float yMin, float yMax) {
    stroke(0);
    strokeWeight(1);
    beginShape();
    for (int i=0; i < data.length; i++) {
      float x = map(i, 0, data.length-1, X1, X2);
      float y = map(data[i], yMin, yMax, Y2, Y1);
      vertex(x, y);
    }
    endShape();
  } // drawGraph()
  
  void movingAverage(float[] data, float yMin, float yMax, int MAP) {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(2);
  
    beginShape();
    for (int i=MAP-1; i < data.length; i++) {
      float sum = 0;
      for (int k=i-(MAP-1); k <= i; k++) {
        sum += data[k];
      }
      float MA = sum/MAP;
      float x = map(i, 0, data.length-1, X1, X2);
      float y = map(MA, yMin, yMax, Y2, Y1);
      vertex(x, y);
    }
    endShape();
  } //movingAverage()
  
  void drawYLabels () {
    fill(255);
    textSize(10);
    textAlign(RIGHT);
    stroke(255);
    for (float i=minPrice; i <= maxPrice; i += 10) {
      float y = map(i, minPrice, maxPrice, Y2, Y1);
      text(floor(i), X1-10, y);
      line(X1, y, X1-5, y);
    }
    textSize(18);
    text("$", X1 - 35, (Y1 + Y2) / 2);
  } // drawYLabels()
  
  void drawXLabels() {
    fill(255);
    stroke(0);
    textSize(10);
    textAlign(CENTER);
  
    textSize(18);
    textAlign(CENTER, TOP);
    text("Date (last year)", (X1 + X2) / 2, Y2 + 10);
  } // drawXLabels()
}