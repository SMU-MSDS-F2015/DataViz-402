import java.util.*;

/*
   There is one ecosystem--it is globally accessible. When created, it will create and hold each of the Zoos, Parks, and Lakes, and populate each in term.
*/

class Ecosystem {
  Habitat[] habitats;
  HashMap<String, Integer> speciesCounts = new HashMap<String, Integer>();
  int year = 0;
  
  Ecosystem() {
    this.habitats = new Habitat[8];
    this.habitats[0] = new Zoo("Woodland Park Zoo");
    this.habitats[1] = new Zoo("Dallas Zoo");
    this.habitats[2] = new Park("Lake Cliff Park");
    this.habitats[3] = new Park("Green Lake Park");
    this.habitats[4] = new Park("Oak Cliff Founders Park");
    this.habitats[5] = new Park("Woodland Park");
    this.habitats[6] = new Lake("Lake Cliff");
    this.habitats[7] = new Lake("Green Lake");

    //drawChart(sketchWindow);
  }
  
  void simulate() {
      year++;
      for(Habitat habitat : habitats) {
        habitat.simulateYear(year);
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
      println(name);
      println(counts[i]);
      i++;
    }
      
    return counts;
  }
}