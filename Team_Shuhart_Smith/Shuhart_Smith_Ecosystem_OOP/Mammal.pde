/*
 Bat
 Dog
 Lions
 
 Mammals have live offspring. Lions have cubs that transform into adult lions.
 Bats and insects fly.
 All the other species will be male or female.
 There are bats, dogs, and lions.
 Bats and dogs are found in parks. Bats may be housed in the zoos.
 Zoos trade lions, but not bats. Lions won't migrate to parks, but bats might. Dogs may frequent multiple parks.
 */

class Mammal extends Animal {
}

class Lion extends Mammal implements IMigratable {

  boolean doIMigrate() {
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

  Habitat migrate(Habitat currentZoo) {
    // There are only two zoos. Migrate to the other
    Habitat newZoo = null;
    for (Habitat habitat : ecosystem.habitats) {
      if (habitat instanceof Zoo && habitat != currentZoo) {
        newZoo = ((Zoo)habitat);
      }
    }

    return newZoo;
  }
}