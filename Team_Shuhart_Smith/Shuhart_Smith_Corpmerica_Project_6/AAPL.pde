float[] getApplePrices() {
// Read the data file...
  String[] lines = loadStrings("AAPLStock.txt");

  // How long is the dataset
  float[] price = new float[lines.length];

  // Parse the needed data
  for (int i=0; i<lines.length; i++) {
    // Frst split each line using commas as separator
    String[] pieces = split(lines[i], ",");

    // get the closing price of stock, and month
    price[i] = float(pieces[5]);
  }
  return price;
}