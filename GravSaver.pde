ParticleGenerator gen;

void setup(){
  size(screen.width,screen.height);
  frameRate(500);
  smooth();
  gen = new ParticleGenerator();
}

void update(){
  gen.update();
}

void draw(){
  update();
  gen.draw();
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    gen.resetGenerator();
  }
  if(key == 'p' || key == 'P' || key == 's' || key == 'S'){
    String saveID = "screenshot_############_"+((int)random(1000,9999))+".jpg";
    saveFrame(saveID);
  }
}
