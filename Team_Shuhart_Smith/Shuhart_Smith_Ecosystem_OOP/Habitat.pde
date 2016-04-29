import java.util.concurrent.CopyOnWriteArrayList;

/*
  The various habitats are implemented here, including:
    * Zoo
    * Park
    * Lake
*/
abstract class Habitat {
  String name;
  CopyOnWriteArrayList<Inhabitant> inhabitants;
  
  Habitat() {}
  
  Habitat(String name) {
    this.name = name;
    this.Populate();
  }
  
  Habitat getAdjacentHabitat() {return null;}
  
  void Populate() {} // This will create one of each appropriate plant/animal to start with. // TODO: Male/Female one each

  void simulateYear() {

/*
    Call on each of the inhabitants:
        boolean doIMigrate()
        Habitat migrate(Habitat oldHome)
        boolean doIReproduce()
        Inhabitant[] produceOffspring()
        boolean doIDie()
        proceedToGrave()
*/
    for(Inhabitant inhabitant : inhabitants) {
      //if (inhabitant.doIMigrate()
      
      Inhabitant seedling = null;
      
      if (inhabitant instanceof ISproutable) {
        if (inhabitant instanceof OakSeed) {
          seedling = ((OakSeed)inhabitant).transform();
        }
        if (inhabitant instanceof MapleSeed) {
          seedling = ((MapleSeed)inhabitant).transform();
        }
        inhabitants.add(seedling);
        inhabitants.remove(inhabitant);
      }
      
      
      if (inhabitant.doIReproduce()) {
        for(Inhabitant offspring : inhabitant.produceOffspring()) {
          inhabitants.add(offspring);
        }
      }
      
      if (inhabitant.doIDie()) {
        inhabitants.remove(inhabitant);
        inhabitant.proceedToGrave();
      }
    }
  }
}

class Zoo extends Habitat{
  Zoo(String name) {
    super(name);
    Populate();
  }
  
  // Need to create the inhabitants of the Zoo
  void Populate() {
  
    inhabitants = new CopyOnWriteArrayList<Inhabitant>();

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

    inhabitants = new CopyOnWriteArrayList<Inhabitant>();

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

    inhabitants = new CopyOnWriteArrayList<Inhabitant>();
 
    //TODO: Add one male, one female
    inhabitants.add(new Bass());
    inhabitants.add(new Cod());
    inhabitants.add(new Moth());
    inhabitants.add(new Dragonfly());
  }
}