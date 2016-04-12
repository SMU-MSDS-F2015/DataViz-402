/*
  The ecosystem has inhabitants; those classes inherit from this abstract class
*/

abstract class Inhabitant implements IReproducable, IMortal {
  float motility;
  float lifeExpectancy;
  float averageOffspring;
  int age;
  Habitat habitat;
  
  boolean doIReproduce() {return false;}
  Inhabitant[] produceOffspring() {return new Animal[0];}

  boolean doIDie() {return false;}
  void proceedToGrave() {}

}