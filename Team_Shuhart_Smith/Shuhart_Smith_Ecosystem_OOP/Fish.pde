/*
** Fish
Both insects and fish (female) lay eggs which may be fertilized.
Fertilized eggs transform into larvae.
Larvae transform into adults
All the other species will be male or female.

*/

class Fish extends Animal {}

class Bass extends Fish implements ILaysEggs {
  boolean doIReproduce() {return true;}
  
  int offspringSize = 2000; 
  
  Bass[] produceOffspring() {
    Bass[] offspring = new Bass[1];
    offspring[0] = new Bass();
    return offspring;
  }

}
class Cod extends Fish implements ILaysEggs {
  boolean doIReproduce() {return true;}
  
  int offspringSize = 1000000; 
    
  Cod[] produceOffspring() {
    Cod[] offspring = new Cod[1];
    offspring[0] = new Cod();
    return offspring;
  }
}