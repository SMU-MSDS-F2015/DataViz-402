/*
  Seeds transform into sprouts (plants)
  Insect and Fish larvae turn into Adults
*/

interface ITransformable {
  boolean doITransform();
  Inhabitant Transform();
}

interface ISproutable extends ITransformable {}

/*
  Through hatching, eggs turn into larvae
*/
interface IHatchable extends ITransformable {}

/*
  Through metamorphosis, larvae turn into adults
*/
interface IMetamorphic extends ITransformable {}