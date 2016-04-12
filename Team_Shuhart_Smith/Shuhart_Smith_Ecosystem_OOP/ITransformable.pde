/*
  Seeds transform into sprouts (plants)
 Insect and Fish larvae turn into Adults
 */

interface ITransformable {
  // When active doesn't allow me to place probability function, but also prevent probability in extended interfaces
  //boolean doITransform(); 
  //Inhabitant Transform();
}

// unable to place probability of success in here either, but works for the classes of trees
// maybe there is a way to not repeat all the probability and just pass in the success threshold?
interface ISproutable extends ITransformable { 
  //boolean doISprout() {
  //  int chance;
  //  int success = 80; //Chance for success that we could vary by creature
  //  for (int i = 0; i < 10; i++) {
  //    chance = int(random(1, 100));
  //    if (chance >= success) {      
  //      return true;
  //    } else {
  //      return false;
  //    }
  //  }
  //  return false;
  //}
}
/*
  Through hatching, eggs turn into larvae
 */
interface IHatchable extends ITransformable {
}

/*
  Through metamorphosis, larvae turn into adults
 */
interface IMetamorphic extends ITransformable {
}