/*
  The various habitats are implemented here, including:
    * Zoo
    * Park
    * Lake
*/
abstract class Habitat {
  String name;
  Inhabitant[] inhabitants;
  
  Habitat() {}
  
  Habitat(String name) {
    this.name = name;
    this.Populate();
  }
  
  Habitat getAdjacentHabitat() {return null;}
  
  void simulateYear(int year) {
    //TODO: call on each of the inhabitants:
    //procreate()
    //migrate()
    //checkPulse() (If dead, go to graveyard)
  }
  
  void Populate() {} // This will create one of each appropriate plant/animal to start with. Perhaps random?
}

class Zoo extends Habitat{
  Zoo(String name) {
    super(name);
  }
  
  // Need to create the inhabitants of the Zoo
  void Populate() {}
}
/*
class Park extends Habitat{}
class Lake extends Habitat{}
  Lakes may have catfish and trout
 
*/