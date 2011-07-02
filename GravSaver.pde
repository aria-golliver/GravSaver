ParticleGenerator gen;
void setup(){
  size(screen.width,screen.height);
  frameRate(24);
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
