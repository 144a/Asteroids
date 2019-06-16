
Ship player = new Ship();

Objects test = new Objects(1, 300, 350);

boolean isVelInc, isRotLeft, isRotRight;


public void setup() {
  size(800,800);
  
}

public void draw() {
  updateScreen();
  
}


public void updateScreen() {
  background(0);
  delay(10);
  
  // Checks for Key presses and modifies ship properties
  if(isVelInc) {
    player.incVelocity();
  }
  if(isRotLeft) {
    player.incAngle();      
  }
  if(isRotRight) {
    player.decAngle();      
  }
  
  // Updates ship object
  player.update();
  test.update();
}

void keyPressed() {
  setMove(key, true);
  
}
 
void keyReleased() {
  setMove(key, false);
}

// Handles multiple key presses at once, allowing for increasing both velocity and angle at the same time;
boolean setMove(int k, boolean b) {
  switch (k) {
  case 's':
    return isRotLeft = b;
  case 'a':
    return isRotRight = b;
  case 'k':
    return isVelInc = b;
  
 
  default:
    return b;
  }
}
