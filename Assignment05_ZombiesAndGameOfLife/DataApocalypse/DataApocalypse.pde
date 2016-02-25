//Vis Assignment 5  //<>//
//Carson - Lieberman - Selvakumar
//Data-Zombie Apocalypse!!!
//References:  SVG image Map: https://commons.wikimedia.org/wiki/File:USA_Counties_with_FIPS_and_names.svg
//             Census Data: https://www.census.gov/newsroom/press-kits/2015/20150326_popestimates.html
//             Census Data by County: http://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?src=bkmk
//             Adjacent County Data: https://www.census.gov/geo/reference/county-adjacency.html

PShape map;
Table currPop;
Table prevPop;  //previous population
int row, rowCount, columnCount;
int popMultiplier=100000;  //multiplier to reduce infection by
boolean DoConwayLife = true;  //Change this to either do the apacolypes or game of life

int livesTaken=0;
PFont font;
int totalPopulation;
PImage img;
int deathCounter=0;

void setup() {
  size(1200, 1200);
  frameRate(16);  //Slow down to make it look beter.
  font = createFont("Herculanum", 36, true);
  textFont(font);
  map = loadShape("Continental_USA_Counties.svg");
  map.disableStyle();
  background(49, 62, 106);
  img = loadImage("wahlberg.jpg");
  noStroke();
  prevPop = loadTable("countyPopAdj.csv", "header");
  rowCount=prevPop.getRowCount();
  currPop = loadTable("countyPopAdj.csv", "header");

  //Set "ConwayValue" to either 0 or 1
  //For Conway Life version
  for (int i=0; i<rowCount; i++) {
    float x1=random(0, 1);
    String id = currPop.getString(i, 0);
    TableRow r=currPop.findRow(id, "ID");
    TableRow r2=prevPop.findRow(id, "ID");
    if (x1<.05) {
      r.setInt("ConwayValue", 0);
      r2.setInt("ConwayValue", 0);
    } else {
      r.setInt("ConwayValue", 1);
      r2.setInt("ConwayValue", 1);
    }
   
    //And because we're iterating, get the total population
    int ppp=r.getInt("Census");
    totalPopulation += ppp;
    println(totalPopulation, ppp);
  }
  println ("Total Pop:", totalPopulation);

  //pick 5 random spots to start by setting them to pop=0
  for (int i=0; i<5; i++) {
    int x1=int(random(0, rowCount-1));
    String id =  currPop.getString(x1, 0);
    TableRow r=currPop.findRow(id, "ID");
     int subCounty=r.getInt("Census");
    totalPopulation -= subCounty;
   r.setInt("Census", 0);
  }
  println ("END SETUP! Total Pop:", totalPopulation);
}
void draw() {
  noStroke();
  scale(1.8);
  translate(25, 25);
  if (!DoConwayLife) {
    zombieLife();
    for (row = 0; row < rowCount; row++) {
      String id = currPop.getString(row, 0);  //Need string because of leading 0's
      try {
        PShape county = map.getChild(id);
        if (currPop.getInt(row, 2)>0) {
          float popdense = currPop.getInt(row, 2);
          int c = 255-int(log(popdense)*36);
          fill(c);
        } else {
          fill(82, 8, 15);
        }
        shape(county, 0, 0);
      }
      catch (NullPointerException e) {
        //Catch missing counties. Okay to ignore these.
      }
    }
  } else { //DoConwayLife
    GameOfLife();
    for (row = 0; row < rowCount; row++) {
      String id = currPop.getString(row, 0);  //Need string because of leading 0's
      try {
        PShape county = map.getChild(id);
        println(id, currPop.getInt(row, 5));
        if (currPop.getInt(row, 5)==0) {
          fill(193, 78, 92);
        } else {
          fill(82, 8, 15);
        }
        shape(county, 0, 0);
      }
      catch (NullPointerException e) {
        //Catch missing counties. Okay to ignore these.
      }
    }
  }
  //Erase previous value
  fill(49, 62, 106);
  rect(0, height*.365-28, 800, height*.365+28);
  fill(0, 0, 0);

  if (totalPopulation<=0) {
    text("WHAMMO!", 0, height*.365);
    deathCounter++;
    println("Death in ", 200-deathCounter);
    if (deathCounter>20) {
    image(img, 0, 0);
    }
  } else 
  {
    text ("Number of Lives Taken: " + nf(livesTaken, 10), 0, height*.365);
    text ("Population remaining: " + nf(totalPopulation, 10), 0, height*.365+57);
  }
}