
// There are oak and maple trees. They don't grow in the lakes, but are found in parks, zoos.
class Tree extends Plant {}

class Oak extends Tree  implements IHasSeeds {

  boolean doIReproduce() {return true;}
  
  OakSeed[] produceOffspring() {
    OakSeed[] offspring = new OakSeed[2];
    for(int i=0; i <2; i++) {
      offspring[i] = new OakSeed();
      println("Generating Oak seeds as offspring!");
    }    return offspring;
  }

}
class Maple extends Tree implements IHasSeeds {
  boolean doIReproduce() {return true;}
  
  MapleSeed[] produceOffspring() {
    MapleSeed[] offspring = new MapleSeed[3];
    for(int i=0; i <3; i++) {
      offspring[i] = new MapleSeed();
      println("Generating Maple seeds as offspring!");
    }
    return offspring;
  }
}