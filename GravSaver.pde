ParticleGenerator gen;
void setup(){
  size(screen.width/2,screen.height/2);
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
