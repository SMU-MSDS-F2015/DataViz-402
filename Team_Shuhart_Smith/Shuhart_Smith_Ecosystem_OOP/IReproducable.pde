/*
 All living things reproduce. Our ecosystem inhabitants do so in the following ways:
  * Giving Birth (mammals)
  * Laying Eggs (fish, insects)
  * Dispersing Seeds (plants)

*/

interface IReproducable {
  boolean doIReproduce();  
  void produceOffspring();
}

interface IGivesBirth extends IReproducable {}
interface ILaysEggs extends IReproducable {}
interface IHasSeeds extends IReproducable {}