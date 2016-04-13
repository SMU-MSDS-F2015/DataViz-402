/*
  Seeds are the precursors that *transform* into Plants
*/

class Seed extends Plant {
  boolean doITransform() {return false;}
  
    boolean doITransform(float probability) {
    if (random(0, 100) <= probability) {
      return true;
    }
    else {
      return false;
    }
  }
}

class OakSeed extends Seed implements ISproutable {
  boolean doITransform() {
  return super.doITransform(70);
  }

  Oak transform() {return new Oak();}

}

class MapleSeed extends Seed implements ISproutable {
  boolean doITransform() {
    return super.doITransform(80);
  }
  
  Maple transform() {return new Maple();}
}

//TBD: class BluegrassSeed extends Seed {}
//TBD: class CattailSeed extends Seed {}