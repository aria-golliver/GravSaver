ParticleGenerator gen;

final boolean DEBUGGING = false;

void setup() {
  size(screen.width, screen.height);
  frameRate(500);
  smooth();
  gen = new ParticleGenerator();
}

void update() {
  gen.update();
}

void draw() {
  update();
  gen.draw();
}

void keyPressed() {
  if (DEBUGGING) {
    if (key == 'r' || key == 'R') {
      gen.resetGenerator();
    }
    if (key == 'p' || key == 'P' || key == 's' || key == 'S') {
      String saveID = "screenshot_############_"+((int)random(1000, 9999))+".jpg";
      saveFrame(saveID);
    }
  } 
  else if (frameCount>1) {
    exit();
  }
}

void mousePressed() {
  if (!DEBUGGING && frameCount>1) {
    exit();
  }
}

void mouseMoved() {
  if (!DEBUGGING && frameCount>1) {
    exit();
  }
}

