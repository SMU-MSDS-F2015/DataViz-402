
// There are oak and maple trees. They don't grow in the lakes, but are found in parks, zoos.
class Tree extends Plant {
}

// Maybe there is a way to not repeat all the probability and just pass in the success threshold?

class Oak extends Tree implements ISproutable {
  boolean doISprout() {
    int chance;
    int success = 80; //Chance for success that we could vary by creature
    for (int i = 0; i < 10; i++) {
      chance = int(random(1, 100));
      if (chance >= success) {      
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
class Maple extends Tree {
  boolean doISprout() {
    int chance;
    int success = 80; //Chance for success that we could vary by creature
    for (int i = 0; i < 10; i++) {
      chance = int(random(1, 100));
      if (chance >= success) {      
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}