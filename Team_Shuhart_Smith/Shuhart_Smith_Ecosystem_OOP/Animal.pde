/*
  Animals and subclasses are implemented here, including:

**Insects
 Dragonfly Larva (implements ILarva)
 Caterpiller (implements ILarva)
 Dragonfly
 Moth
 
  Insects don't live in lakes, but they may be found to be flying over them.
  Both insects and fish (female) lay eggs which may be fertilized.
  Fertilized eggs transform into larvae.
  Larvae transform into adults
  Bats and insects fly.
  Plants/insects have lots of offspring  
  All the other species will be male or female.

**Mammals
 Bat
 Dog
 Lions

  Mammals have live offspring. Lions have cubs that transform into adult lions.
  Bats and insects fly.
  All the other species will be male or female.
  There are bats, dogs, and lions.
  Bats and dogs are found in parks. Bats may be housed in the zoos.
  Zoos trade lions, but not bats. Lions won't migrate to parks, but bats might. Dogs may frequent multiple parks.

** Fish
Both insects and fish (female) lay eggs which may be fertilized.
Fertilized eggs transform into larvae.
Larvae transform into adults
All the other species will be male or female.
 
*/

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