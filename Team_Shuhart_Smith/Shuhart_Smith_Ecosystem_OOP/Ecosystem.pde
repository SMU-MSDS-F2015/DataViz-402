/*
   There is one ecosystem--it is globally accessible. When created, it will create and hold each of the Zoos, Parks, and Lakes, and populate each in term.
*/

class Ecosystem {
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
}