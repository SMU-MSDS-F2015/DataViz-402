/**
 *  This is essentially a dynamically-allocated Bird[]
 *  that also governs which bird is the bomber...
 */
public class Flock extends ArrayList<Bird> {
  
  /**
   * We're going to store a reference (pointer) to
   * the bomber for easy access to him.
   */
  final Bomber bomber;
  
  public Flock(int size) {
    super(size);
    
    if(size <= 0)
      throw new IllegalArgumentException(size+" is not a valid size");
    
    Bird currentBird;
    final int bomberIdx = floor(random(0, size)); // Pick a random index
    for(int i = 0; i < size; i++) {
      currentBird = i == bomberIdx ? new Bomber() : new Bird();
      super.add(currentBird); // Adds the bird to the next available spot in the array(list)
    }
    
    bomber = (Bomber)super.get(bomberIdx);
  }
  
  public Bird getBomber() {
    return bomber;
  }
}