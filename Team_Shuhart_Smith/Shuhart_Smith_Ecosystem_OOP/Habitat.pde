/*
  The various habitats are implemented here, including:
    * Zoo
    * Park
    * Lake
*/
abstract class Habitat {
  String name;
  ArrayList<Inhabitant> inhabitants;
  
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
    Populate();
  }
  
  // Need to create the inhabitants of the Zoo
  void Populate() {}
    //Oak Tree
    //Maple Tree
    //Moth
    //Bat
    //Lions
}

class Park extends Habitat{
  Park(String name) {
    super(name);
    Populate();
  }
  
  // Need to create the inhabitants of the Park
  void Populate() {}
    //Oak Tree
    //Maple Tree
    //Dog
    //Bat
    //Moth
    //Dragonfly
  
}

class Lake extends Habitat{
  Lake(String name) {
    super(name);
    Populate();
  }
  
  // Need to create the inhabitants of the Lake
  void Populate() {}
    //Bass
    //Cod
    //Moth
    //Dragonfly
}