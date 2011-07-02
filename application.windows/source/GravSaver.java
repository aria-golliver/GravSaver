import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class GravSaver extends PApplet {

ParticleGenerator gen;
public void setup(){
  size(screen.width,screen.height);
  frameRate(500);
  smooth();
  gen = new ParticleGenerator();
}

public void update(){
  gen.update();
}

public void draw(){
  update();
  gen.draw();
}

public void keyPressed(){
  if(key == 'r' || key == 'R'){
    gen.resetGenerator();
  }
  if(key == 'p' || key == 'P' || key == 's' || key == 'S'){
    String saveID = "screenshot_############_"+((int)random(1000,9999))+".jpg";
    saveFrame(saveID);
  }
}
class Asteroid extends PVector {
  PVector  pPos;
  PVector  vel; 
  PVector  acc;
  float    mass;
  boolean  alive;

  Asteroid() {
    super();
    alive = true;
    pPos = new PVector();
    vel = new PVector(0,0,0);
    acc = new PVector(0,0,0);
    mass = 100;
  }

  public void changePosition(PVector pos) {
    set(pos);
    pPos.set(pos);
  }

  public void update(Planet[] planet) {
    if (alive) {
      acc.set(0, 0, 0);

      for (int i = 0; i<planet.length;i++) {
        float ang = calcAngle(planet[i]);
        float g = 1;
        float force = (float)(g*(mass * planet[i].mass)/(Math.pow(dist(this, planet[i]), 2)));
        acc.add(-force/mass * cos(ang), force/mass * sin(ang), 0);
      }

      vel.add(acc);
      add(vel);
      checkEdges();
      checkCollision(planet);
    }
  }

  public void checkEdges() {
    float frame = 20;
    if (x<-frame) {
      x=-frame;
      alive = false;
    }
    if (x>width+frame) {
      x=width+frame;
      alive = false;
    }
    if (y<-frame) {
      y=-frame;
      alive = false;
    }
    if (y>height+frame) {
      y = height+frame;
      alive = false;
    }
  }

  public void checkCollision(Planet[] planet) {
    for (int i = 0;i<planet.length; i++) {
      float dis = dist(this, planet[i]);
      if (dis<sqrt(this.mass/PI)+sqrt(planet[i].mass/PI)) {
        alive=false;
      }
    }
  }

  public void draw() {
    if(alive){
      line(x, y, pPos.x, pPos.y);
      pPos.set(x, y, 0);
    }
  }
  public float calcAngle (PVector a) {
    return -(float)(Math.atan2(y-a.y, x-a.x ));
  }
}

class ColorSchemer {
  private int          currentSchemeID;
  private final int    totalSchemes = 4;
  private int[]        totalParticles;

  ColorSchemer() {
    super();
    totalParticles = new int[totalSchemes];
    for (int i = 0; i<totalParticles.length; i++) {
      totalParticles[i] = 1000;
    }
    totalParticles[0] = 8000;
    totalParticles[1] = 8000;
    currentSchemeID = 0;
  }

  public void newScheme() {
    currentSchemeID = floor(random(0, totalSchemes));
  }

  public void setStroke(Asteroid asteroid) {
    float r = 255;
    float g = 255;
    float b = 255;
    float a = 255;
    switch(currentSchemeID) {
    case 0:
      r = 50;
      g = 0;
      b = 50;
      a = 10;
      break;
    case 1:
      r = 255;
      g = 255;
      b = 255;
      a = 10;
      break;
    case 2:
      r = asteroid.dist(asteroid.pPos)*8;
      g = 40;
      b = 80;
      break;

      /*case 2:
       r = (asteroid.x/width)*255;
       g = (asteroid.y/height)*255;
       b = 255 - (asteroid.x/width)*127 - (asteroid.x/width)*127;
       break;
       case 3:
       r = random(0, 255);
       g = random(0, 255);
       b = random(0, 255);
       a = random(0, 255);
       break;*/
    default:
      r = asteroid.dist(asteroid.pPos)*8;
      g = 40;
      b = 80;
      break;
    }
    stroke(r, g, b, a);
  }
  public int getTotalParticles() {
    return totalParticles[currentSchemeID];
  }
}

class ParticleGenerator {
  int resets;
  int cnr;
  PVector[] cornerPositions;
  Asteroid[] asteroid;
  Planet[] planet;
  ColorSchemer colorScheme;

  ParticleGenerator() {
    cornerPositions = new PVector[4];
    cornerPositions[0] = new PVector(-20, -20, 0);
    cornerPositions[1] = new PVector(-20, height + 20, 0);
    cornerPositions[2] = new PVector(width + 20, height + 20, 0);
    cornerPositions[3] = new PVector(width + 20, -20, 0);
    colorScheme = new ColorSchemer();
    resetGenerator();
  }
  /* 
   * generates particles
   * generates planets
   * positions both
   * resets screen after certian number of resets
   */

  public void resetGenerator() {
    println("reset");
    resets = 10;
    cnr = floor(random(0, 4));
    colorScheme.newScheme();
    asteroid = new Asteroid[colorScheme.getTotalParticles()];
    planet = new Planet[8];

    for ( int i = 0; i<asteroid.length; i++) {
      asteroid[i] = new Asteroid();
    }

    for ( int i = 0; i<planet.length; i++) {
      planet[i] = new Planet();
    }

    noStroke();
    fill(0);
    rect(0, 0, width, height);
    resetAsteroids();
    resetPlanets();
  }

  public void resetAsteroids() {
    if (resets != 0 || true) {
      for (int i = 0; i<asteroid.length; i++) {
        float a = random(-PI, PI);
        float v = random(0, 4);
        asteroid[i].vel.set(v*cos(a), v*sin(a), 0);
        asteroid[i].acc.set(0, 0, 0);
        asteroid[i].changePosition(cornerPositions[cnr]);
        asteroid[i].alive = true;
      }
      resets--;
    } 
    else {
      resetGenerator();
    }
  }

  public void resetPlanets() {
    for (int i = 0; i<planet.length; i++) {
      planet[i].set(random(100, width), random(100, height), 0);
    }
  }

  public void update() {
    for (int i = 0; i<asteroid.length; i++) {
      asteroid[i].update(planet);
    }

    for (int i = 0; i<asteroid.length; i++) {
      if (asteroid[i].alive) 
      {
        //print("ALIVE");
        return;
      }
    }

    print("DEAD");
    resetAsteroids();
    resetPlanets();
  }

  public void draw() {
    for (int i = 0; i<asteroid.length; i++) {
      colorScheme.setStroke(asteroid[i]);
      //stroke(255);
      asteroid[i].draw();
    }
  }
}

class Planet extends PVector{
  float mass = 10000;
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--hide-stop", "GravSaver" });
  }
}
