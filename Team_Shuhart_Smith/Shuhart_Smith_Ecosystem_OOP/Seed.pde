/*
  Seeds are the precursors that *transform* into Plants
*/

class Seed extends Plant implements ISproutable {
  boolean doITransform() {return false;}
  Plant transform() {return new Plant();}
  
    boolean doITransform(float probability) {
    if (random(0, 100) <= probability) {
      return true;
    }
    else {
      return false;
    }
  }
}

class OakSeed extends Seed {
  boolean doITransform() {
  return super.doITransform(70);
  }

  Plant Transform() {return new Plant();}

}

class MapleSeed extends Seed{
  boolean doITransform() {
    return super.doITransform(80);
  }
  
  Plant Transform() {return new Maple();}
}

//TBD: class BluegrassSeed extends Seed {}
//TBD: class CattailSeed extends Seed {}