

class Projectile {
  private double xPos;
  private double yPos;
  private double xVol;
  private double yVol;
  
  // Determines how long projectile will exist
  private double counter;
  
  Projectile(double ixpos, double iypos, double iangle) {
    xPos = ixpos;
    yPos = iypos;
    xVol = cos(radians((float)(iangle))) * 5;
    yVol = sin(radians((float)(iangle))) * 5;
    counter = 0;
  }
  
  public void update() {
    
    reDraw();
  }
  
  public void reDraw() {
    
  }
  
  
}
  
