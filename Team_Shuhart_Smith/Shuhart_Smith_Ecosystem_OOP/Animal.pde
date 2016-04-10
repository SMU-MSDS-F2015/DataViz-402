class Animal extends Inhabitant {}

class Mammal extends Animal {}

class Lion extends Mammal implements IMigratable {
  Habitat Migrate(Habitat currentZoo) {
    // There are only two zoos. Migrate to the other
    Habitat newZoo = null;
    for(Habitat habitat : ecosystem.habitats) {
      if (habitat instanceof Zoo && habitat != currentZoo) {
        newZoo = ((Zoo)habitat);
      }
    }
    
    return newZoo;
  }
}