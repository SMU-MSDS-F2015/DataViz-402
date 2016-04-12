/*
**Insects
 Dragonfly Larva (implements ILarva)
 Caterpiller (implements ILarva)
 Dragonfly
 Moth
 
  Insects don't live in lakes, but they may be found to be flying over them.
  Both insects and fish (female) lay eggs which may be fertilized.
  Fertilized eggs transform into larvae.
  Larvae transform into adults
  Bats and insects fly.
  Plants/insects have lots of offspring  
  All the other species will be male or female.
*/
class Insect extends Animal {}

class Dragonfly extends Insect implements ILaysEggs  {
  boolean doIReproduce() {return true;}
  
  Dragonfly[] produceOffspring() {
    Dragonfly[] offspring = new Dragonfly[1];
    offspring[0] = new Dragonfly();
    return offspring;
  }

}
class Moth extends Insect implements ILaysEggs  {
  boolean doIReproduce() {return true;}
  
  Moth[] produceOffspring() {
    Moth[] offspring = new Moth[1];
    offspring[0] = new Moth();
    return offspring;
  }
}