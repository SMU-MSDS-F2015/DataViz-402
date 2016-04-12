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
    //boolean doIMigrate()
    //Habitat migrate(Habitat oldHome)
    //boolean doIReproduce()
    //Inhabitant[] produceOffspring()
    //boolean doIDie()
    // proceedToGrave()
  }
  
   {
    println ("Lion dying and proceeding to graveyard");
  }
  
  void Populate() {} // This will create one of each appropriate plant/animal to start with. Perhaps random?
}

class Zoo extends Habitat{
  Zoo(String name) {
    super(name);
    Populate();
  }
  
  // Need to create the inhabitants of the Zoo
  void Populate() {
  
    inhabitants = new ArrayList<Inhabitant>();

    inhabitants.add(new Oak());
    inhabitants.add(new Maple());
    
    //TODO: Add one male, one female
    inhabitants.add(new Moth());
    inhabitants.add(new Bat());
    inhabitants.add(new Lion());
  }
}

class Park extends Habitat{
  Park(String name) {
    super(name);
    Populate();
  }
  
  // Need to create the inhabitants of the Park
  void Populate() {

    inhabitants = new ArrayList<Inhabitant>();

    inhabitants.add(new Oak());
    inhabitants.add(new Maple());

    //TODO: Add one male, one female
    inhabitants.add(new Moth());
    inhabitants.add(new Bat());
    inhabitants.add(new Dog());
  }
}

class Lake extends Habitat{
  Lake(String name) {
    super(name);
    Populate();
  }
  
  // Need to create the inhabitants of the Lake
  void Populate() {

    inhabitants = new ArrayList<Inhabitant>();
 
    //TODO: Add one male, one female
    inhabitants.add(new Bass());
    inhabitants.add(new Cod());
    inhabitants.add(new Moth());
    inhabitants.add(new Dragonfly());
  }
}