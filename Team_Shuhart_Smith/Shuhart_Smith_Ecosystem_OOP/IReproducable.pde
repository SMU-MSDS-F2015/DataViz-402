/*
 All living things reproduce. Our ecosystem inhabitants do so in the following ways:
  * Giving Birth (mammals, marsupials)
  * Laying Eggs (fish, insects)
  * Dispersing Seeds (plants)

*/

interface IReproducable {
}

interface IGivesBirth extends IReproducable {}
interface ILaysEggs extends IReproducable {}
interface IHasSeeds extends IReproducable {}