/*
  Animals are:
     Mammals
     Fish
     Insects

All are male or female.
 
*/

enum Sex {Male, Female};

class Animal extends Inhabitant {
  float proportionMale;
  Sex sex;
}