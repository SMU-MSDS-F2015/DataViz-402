public class Bomber extends Bird {
  int delegateNumber = 0;
  
  // This queue will hold the list of delegates that have been "dropped"
  ArrayList<Delegate> delegates;

  public Bomber() {
    super(true); // ALWAYS bomber
    
    // Make sure the bomber is higher in the atmosphere
    this.ypos = Math.min(this.ypos, 40);
    
    // Speed up the bomber for the demo
    this.speedX = this.speedX * 2;
    
    Caucus iowa = new Caucus();
    delegates = iowa.loadData();
  }
  
  @Override
  public void drawBird() {
    super.drawPt1();
    
    if (delegateNumber < delegates.size() - 1) {
      boolean isDemocrat = false;
      if (delegates.get(delegateNumber).party.toUpperCase().startsWith("D"))
        isDemocrat = true;
  
      // Get the elephant on the noggin
      if(isDemocrat && xpos >= 275 && xpos <= 300 && createNewBomb())
        createExcretion(0.39);
        
      // Get the elephant on the trunk
      if(isDemocrat && xpos >= 375 && xpos <= 430 && createNewBomb())
        createExcretion(0.26);
        
      // Get the donkey on the noggin
      if(!isDemocrat && xpos >= 600 && xpos <= 630 && createNewBomb())
        createExcretion(0.44);
        
      // Get the donkey on the ear
      if(!isDemocrat && xpos >= 650 && xpos <= 675 && createNewBomb())
        createExcretion(0.36);
    }
      
    // If it's empty, it won't do anything
    for(Delegate delegate: delegates)
      if (delegate.dropped)
        delegate.drawExcretion();

    super.drawPt2();
  }
  
  public void createExcretion(float factor) {
      
    // Stop "creating" once all have been dropped
    if(delegateNumber >= delegates.size())
      return;

     delegates.get(delegateNumber).DropDelegate(this.xpos, this.ypos, factor);
     delegateNumber++;
  }
  
  /** 30% chance of new excretion */
  private boolean createNewBomb() {
    return random(0,100) < 30;
  }
}