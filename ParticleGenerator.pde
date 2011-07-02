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

  void resetGenerator() {
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

  void resetAsteroids() {
    if (resets != 0) {
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

  void resetPlanets() {
    for (int i = 0; i<planet.length; i++) {
      planet[i].set(random(100, width), random(100, height), 0);
    }
  }

  void update() {
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
  }


  void draw() {
    for (int i = 0; i<asteroid.length; i++) {
      colorScheme.setStroke(asteroid[i]);
      //stroke(255);
      asteroid[i].draw();
    }
  }
}

