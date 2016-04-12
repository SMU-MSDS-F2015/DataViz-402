import org.gicentre.utils.stat.*;  
import java.util.*;

/*
   There is one ecosystem--it is globally accessible. When created, it will create and hold each of the Zoos, Parks, and Lakes, and populate each in term.
*/

class Ecosystem implements IChartable {
  final int simulationYears = 10;
  Habitat[] habitats;
  HashMap<String, Integer> speciesCounts = new HashMap<String, Integer>();
  
  Ecosystem() {}

  Ecosystem(PApplet sketchWindow) {
    this.habitats = new Habitat[8];
    this.habitats[0] = new Zoo("Woodland Park Zoo");
    this.habitats[1] = new Zoo("Dallas Zoo");
    this.habitats[2] = new Park("Lake Cliff Park");
    this.habitats[3] = new Park("Green Lake Park");
    this.habitats[4] = new Park("Oak Cliff Founders Park");
    this.habitats[5] = new Park("Woodland Park");
    this.habitats[6] = new Lake("Lake Cliff");
    this.habitats[7] = new Lake("Green Lake");
    simulate();
    drawChart(sketchWindow);
  }
  
  void simulate() {
    for(int year = 0; year < simulationYears; year++) {
      //TODO: Call simulateYear on each habitat
    }
  }
  
  void getSpeciesCounts() {
    for(Habitat habitat : this.habitats) {
      for(Inhabitant inhabitant : habitat.inhabitants) {
        String className = inhabitant.getClass().toString();

        // class Shuhart_Smith_Ecosystem_OOP$Oak
        String inhabitantType = className.substring(34);

        if (speciesCounts.containsKey(inhabitantType))
          speciesCounts.put(inhabitantType, speciesCounts.get(inhabitantType) + 1);
        else
          speciesCounts.put(inhabitantType, 1);
      }
    }
  }
  
  String[] getCategories() {
    String[] species = speciesCounts.keySet().toArray(new String[0]);
    Arrays.sort(species);
    return species;
  }
  
  // Just stub this out for now and get the counts later.
  
  float[] getValues() {
    
    String[] categories = getCategories();
    float[] counts = new float[categories.length];
    int i = 0;
    for(String name : categories) {
      counts[i] = speciesCounts.get(name);
      i++;
      println(name);
      println(counts[i]);
    }
      
    return counts;
  }
  
  void drawChart(PApplet sketchWindow) {
    getSpeciesCounts();
    barChart = new BarChart(sketchWindow);
       
    barChart.showValueAxis(true);
    barChart.showCategoryAxis(true);
    barChart.transposeAxes(true);
    barChart.setBarColour(color(200,80,80,150));
    barChart.setBarGap(4);
  
    barChart.setData(this.getValues());
    barChart.setBarLabels(this.getCategories());
    barChart.draw(100, 100, 500, 500);
    fill(120);
    textSize(18);
    text("Number of Inhabitants at Simulation End", 200, 70);
  }
}