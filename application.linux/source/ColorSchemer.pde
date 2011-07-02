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

  void newScheme() {
    currentSchemeID = floor(random(0, totalSchemes));
  }

  void setStroke(Asteroid asteroid) {
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
  int getTotalParticles() {
    return totalParticles[currentSchemeID];
  }
}

