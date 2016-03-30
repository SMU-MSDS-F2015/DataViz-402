class StockQuote extends DateDataPoint {

  // Constructor that pulls out the date into days previous and stores in public field
  StockQuote(String date, float value) {
    super(date, value);
  }
}