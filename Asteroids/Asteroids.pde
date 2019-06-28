// Player initialization
Ship player = new Ship();

// Test object
Objects test = new Objects(1, 300, 350);

Objects[] objArr = new Objects[30];

// Needed for determining key presses
boolean isVelInc, isRotLeft, isRotRight, isFiring;


public void setup() {
  size(800,800);
  for(int i = 0; i < 10; i++) {
    objArr[i] = new Objects(3, 300, 350);
  }
}

public void draw() {
  updateScreen();
  
}

// Determines collision between projectiles and objects
// Handles shooting speed and limit
public void updateFiring() {
  
}

// Checks for collision between objects and updates objects position
public void updateObjects() {
  for(int i = 0; i < objArr.length; i++) {
    if(objArr[i] != null && objArr[i].checkCollision(player.getX(), player.getY())) {
      // Will be replaced with life counter and game restart
      exit();
    } else if(objArr[i] != null) {
      objArr[i].update();
    }
    
  }
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
  if(isFiring) {
    updateFiring();
  }
  
  // Updates ship
  player.update();
  
  // Updates both position and collision for objects
  updateObjects();
  
  // println(test.checkCollision(player.getX(), player.getY()));
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
  case 'l':
    return isFiring = b;
  default:
    return b;
  }
}
