/*
  Seeds are the precursors that *transform* into Plants
*/

class Seed extends Plant implements ISproutable {
  boolean doITransform() {return false;};
  Plant Transform() {return new Plant();};
}

class OakSeed extends Seed {}
class MapleSeed extends Seed{}

//TBD: class BluegrassSeed extends Seed {}
//TBD: class CattailSeed extends Seed {}