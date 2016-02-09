/**
 * These are the species of birds
 */
public enum Species implements DrawableSpecies {
  CARDINAL {
    @Override public int getR() { return 150; }
    @Override public int getG() { return 0; }
    @Override public int getB() { return 0; }
    @Override public float getSize() { return 1.2; }
  },
  
  CANARY {
    @Override public int getR() { return 255; }
    @Override public int getG() { return 255; }
    @Override public int getB() { return 0; }
    @Override public float getSize() { return 0.6; }
  },
  
  BLUEBIRD {
    @Override public int getR() { return 0; }
    @Override public int getG() { return 0; }
    @Override public int getB() { return 150; }
    @Override public float getSize() { return 1.0; }
  },
  
  CROW {
    @Override public int getR() { return 0; }
    @Override public int getG() { return 0; }
    @Override public int getB() { return 0; }
    @Override public float getSize() { return 1.4; }
  },
  
  BOMBER {
    @Override public int getR() { return 200; }
    @Override public int getG() { return 4; }
    @Override public int getB() { return 201; }
    @Override public float getSize() { return 1.4; }
  }
}