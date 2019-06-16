// Ship class used to control the ship and its concurrent projectiles

class Ship {
  private double xPos; 
  private double yPos; 
  // In degrees, all trigonometric calculations will be done without radians for simplification
  private double ship_Angle;
  private double xVol;
  private double yVol;
  
  // Ship/Map Properties
  int max_projectiles = 0;
  int size_num = 800;
  
  // Sets the ship to the middle of the screen
  Ship() {
    xPos = size_num / 2;
    yPos = size_num / 2;
    xVol = 0;
    yVol = 0;
  }
  
  public int getX() {
    return (int)(xPos);
  }
  public int getY() {
    return (int)(yPos);
  }
  
  public void incVelocity() {
    // Caps velocity as 15 pixels per frame
    
    // Should correctly take velocity and angle and split them into vertical and horizontal components
    // .3 is currently arbitrary
    if(sqrt((float)((xVol * xVol) + (yVol * yVol))) < 10) {
      xVol += (double)(.3 * cos(radians((float)(ship_Angle))));
      yVol += (double)(.3 * sin(radians((float)(ship_Angle))));
    }
    println(xVol + " " + yVol);
  }
  
  public void incAngle() {
    ship_Angle += 5;
    
    // Avoiding possible double overflow
    if(ship_Angle > 360) {
      ship_Angle = 0;
    }
    if(ship_Angle < 0) {
      ship_Angle = 360;
    }
    println(ship_Angle);
  }
  
  public void decAngle() {
    ship_Angle -= 5;
    
    // Avoiding possible double overflow
    if(ship_Angle > 360) {
      ship_Angle = 0;
    }
    if(ship_Angle < 0) {
      ship_Angle = 360;
    }
    println(ship_Angle);
  }
  
  public void update() {
    // Corrects velocity by 14/15 of original value
    // Needs to be fine tuned
    if(abs((float)(xVol)) > 0.001) {
      xVol *= (90.0/91.0);
    } 
    if(abs((float)(yVol)) > 0.001) {
      yVol *= (90.0/91.0);
    } 
    
    // Adds the horizontal and vertical velocity components to ship position
    xPos += xVol;
    yPos += yVol;
    
    // Screen wrapping conditions
    if(xPos < 0) {
      xPos = size_num;
    }
    if(yPos < 0) {
      yPos = size_num;
    }
    if(xPos > size_num) {
      xPos = 0;
    }
    if(yPos > size_num) {
      yPos = 0;
    }
    reDraw();
    
  }
  
  
  public void reDraw() {
    stroke(255);
    // Square placeholder for the time being
    rect((float)xPos - 5, (float)yPos - 5, 10, 10);
    
    // Velocity component visualization
    stroke(255, 0, 0);
    line((float)xPos, (float)yPos, (float)xPos, (float)(yVol * 5 + yPos));
    stroke(255, 0, 0);
    line((float)xPos, (float)yPos, (float)(xVol * 5 + xPos), (float)yPos);
    stroke(0, 255, 0);
    line((float)xPos, (float)yPos, (float)(xVol * 5 + xPos), (float)((float)(yVol * 5 + yPos)));
  }
} 
