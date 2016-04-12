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

class Mammal extends Animal {}

class Lion extends Mammal implements IMigratable, IGivesBirth, IMortal {
  
  boolean doIMigrate() {return false;} // TODO: add probability to this
  
  boolean doIDie() {return false;} // TODO: add probability to this
  
  void proceedToGrave() {
    println ("Lion dying and proceeding to graveyard");
  }
  
  Habitat migrate(Habitat currentZoo) {
    // There are only two zoos. Migrate to the other
    Habitat newZoo = null;
    for(Habitat habitat : ecosystem.habitats) {
      if (habitat instanceof Zoo && habitat != currentZoo) {
        newZoo = ((Zoo)habitat);
      }
    }
    
    return newZoo;
  }

  boolean doIReproduce() {return true;}
  
  Lion[] produceOffspring() {
    Lion[] offspring = new Lion[1];
    offspring[0] = new Lion();
    return offspring;
  }


}

class Bat extends Mammal implements IGivesBirth {
  boolean doIReproduce() {return true;}
  
  Bat[] produceOffspring() {
    Bat[] offspring = new Bat[1];
    offspring[0] = new Bat();
    return offspring;
  }
}


class Dog extends Mammal implements IGivesBirth {
  boolean doIReproduce() {return true;}
  
  Dog[] produceOffspring() {
    Dog[] offspring = new Dog[1];
    offspring[0] = new Dog();
    return offspring;
  }
}