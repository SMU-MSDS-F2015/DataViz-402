// Import Wordcram, install into Processing library (default will be
// home/documents folder=>Processing/libraries from http://wordcram.org
import wordcram.*;
import wordcram.text.*;

WordCram wordCram;

void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB);
  
  jsonToTxt();
  initWordCram();
}

void jsonToTxt() {
    
  // Open PrintWriter to output the tweets to text file
  PrintWriter output = createWriter("data/KayneTweets.txt");

  // Load the JSON file as a JSON object
  JSONObject jsonFile = loadJSONObject("data/KanyeTweets.json");
  
  // Get the array of tweet objects from the JSON
  JSONArray tweets = jsonFile.getJSONArray("Tweets");

  // Iterate through each tweet, and print the text to file
  for(int i = 0; i < tweets.size(); i++) {
    JSONObject tweet = tweets.getJSONObject(i);
    output.println(tweet.getString("Text"));
  }
  output.flush();
  output.close();
}

// Create the WordCram from the output text file
void initWordCram() {
  wordCram = new WordCram(this)
      .fromTextFile("data/KayneTweets.txt")
      .sizedByWeight(10, 90)
      .withColors(color(0, 250, 200), color(30), color(170, 230, 200));
}

// Draw each word until done
void draw() {
  if (wordCram.hasMore()) {
    wordCram.drawNext();
  }
}


// Restart on mouse click
void mouseClicked() {
  background(255);
  initWordCram();
}