abstract class Habitat {
  String name;
  IInhabitable[] inhabitants;
  
  Habitat() {}
  
  Habitat(String name) {
    this.name = name;
  }
}

class Zoo extends Habitat{
  Zoo(String name) {
    super(name);
  }
}
/*
class Park extends Habitat{}
class Lake extends Habitat{}
*/