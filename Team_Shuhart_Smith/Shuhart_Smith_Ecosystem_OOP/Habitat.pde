/*
  The various habitats are implemented here, including:
    * Zoo
    * Park
    * Lake
*/
abstract class Habitat {
  String name;
  Inhabitant[] inhabitants;
  
  Habitat() {}
  
  Habitat(String name) {
    this.name = name;
    this.Populate();
  }
  
  void Populate() {}
}

class Zoo extends Habitat{
  Zoo(String name) {
    super(name);
  }
  
  // Need to create the inhabitants of the Zoo
  void Populate() {}
}
/*
class Park extends Habitat{}
class Lake extends Habitat{}
  Lakes may have catfish and trout
 
*/