
// There are oak and maple trees. They don't grow in the lakes, but are found in parks, zoos.
class Tree extends Plant {}

class Oak extends Tree  implements IReproducable {

  boolean doIReproduce() {return true;}
  
  OakSeed[] produceOffspring() {
    OakSeed[] offspring = new OakSeed[1];
    offspring[0] = new OakSeed();
    return offspring;
  }

}
class Maple extends Tree implements IHasSeeds {
  boolean doIReproduce() {return true;}
  
  MapleSeed[] produceOffspring() {
    MapleSeed[] offspring = new MapleSeed[1];
    offspring[0] = new MapleSeed();
    return offspring;
  }
}