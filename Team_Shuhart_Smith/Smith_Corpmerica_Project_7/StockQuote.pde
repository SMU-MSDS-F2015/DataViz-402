class StockQuote {
  int closingDateId;
  float closingPrice;

  // Constructor that pulls out the date into days previous and stores in public field
  StockQuote(String closingDate, float closingPrice) {
    String[] dateParts = closingDate.split("-");
    String dateIdString = dateParts[0] + dateParts[1] + dateParts[2];
    this.closingDateId = parseInt(dateIdString);
    this.closingPrice = closingPrice;
  }
}

    // TODO: Modify the linecharting giStat code to allow Date for y-axis pairs on XYChart

//import java.util.Date;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;

  //Date closingDate;

    //SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
    //Date date = null;
    //try 
    //{
    //  date = formatter.parse(closingDate);
    //}
    //catch (ParseException e) {
    //  e.printStackTrace();
    //}
    
    //this.closingDate = date;