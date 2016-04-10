/*
   There is one ecosystem--it is globally accessible. When created, it will create and hold each of the Zoos, Parks, and Lakes, and populate each in term.
*/

class Ecosystem {
  Habitat[] habitats;
  
  Ecosystem() {
    habitats = new Habitat[8];
    habitats[0] = new Zoo("Woodland Park");
  }
}