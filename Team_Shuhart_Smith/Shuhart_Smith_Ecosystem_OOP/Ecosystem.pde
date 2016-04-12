/*
   There is one ecosystem--it is globally accessible. When created, it will create and hold each of the Zoos, Parks, and Lakes, and populate each in term.
*/

class Ecosystem implements IChartable {
  final int simulationYears = 10;
  Habitat[] habitats;
  
  Ecosystem() {
    habitats = new Habitat[8];
    habitats[0] = new Zoo("Woodland Park Zoo");
    habitats[1] = new Zoo("Dallas Zoo");
    habitats[2] = new Park("Lake Cliff Park");
    habitats[3] = new Park("Green Lake Park");
    habitats[4] = new Park("Oak Cliff Founders Park");
    habitats[5] = new Park("Woodland Park");
    habitats[6] = new Lake("Lake Cliff");
    habitats[7] = new Lake("Green Lake");
  }
  
  void Simulate() {
    for(int year = 0; year < simulationYears; year++) {
      //TODO: Call simulateYear on each habitat
    }
  }
  
  String[] GetCategories() {
    String[] inhabitantTypes = new String[11];
    inhabitantTypes[0] = "Bass";
    inhabitantTypes[1] = "Cod";
    inhabitantTypes[2] = "Dragonflies";
    inhabitantTypes[3] = "Moths";
    inhabitantTypes[4] = "Bats";
    inhabitantTypes[5] = "Lions";
    inhabitantTypes[6] = "Dogs";
    inhabitantTypes[7] = "Oaks";
    inhabitantTypes[8] = "Maple";
    inhabitantTypes[9] = "Oak Seeds";
    inhabitantTypes[10] = "Maple Seeds";
    
    return inhabitantTypes;
  }
  
  int[] GetCounts() {
    int[] counts = new int[11];
    for(int i=0; i<11; i++) {
      counts[i] = int(random(0,100));
    }
    
    return counts;
  }
}