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

class Lion extends Mammal implements IMigratable, IGivesBirth, IMortal {

  boolean doIMigrate() {
    int success = 80;
    int chance = int(random(1, 100));
    println(chance);
    if (chance >= success) {
      print("Chance was more than " + success + " at " + chance);
      return true;
    } else {
      print("Chance was less than " + success + " at " + chance);
      return false;
    }    
  } // TODO: add probability to this

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

  boolean doIReproduce() {
    return true;
  }

  Lion[] produceOffspring() {
    int count = int(random(1, 4));
    Lion[] offspring = new Lion[count];
    for (int i=0; i < count; i++) {
      offspring[i] = new Lion();
    }
    return offspring;
  }

  boolean doIDie() {
    int success = 80;
    int chance = int(random(1, 100));
    println(chance);
    if (chance >= success) {
      print("Chance was more than " + success + " at " + chance);
      return true;
    } else {
      print("Chance was less than " + success + " at " + chance);
      return false;
    }
  } // TODO: add probability to this

  void proceedToGrave() {
    println ("Lion dying and proceeding to graveyard");
  }
}

class Bat extends Mammal implements IGivesBirth {
  boolean doIReproduce() {
    return true;
  }

  Bat[] produceOffspring() {
    Bat[] offspring = new Bat[1];
    offspring[0] = new Bat();
    return offspring;
  }
}


class Dog extends Mammal implements IGivesBirth {
  boolean doIReproduce() {
    return true;
  }

  Dog[] produceOffspring() {
    Dog[] offspring = new Dog[1];
    offspring[0] = new Dog();
    return offspring;
  }
}