class ColorSchemer {
  private int          currentSchemeID;
  private final int    totalSchemes = 4;
  private int[]        totalParticles;

  ColorSchemer() {
    super();
    totalParticles = new int[totalSchemes];
    currentSchemeID = 0;
    for (int i = 0; i<totalParticles.length; i++) {
      totalParticles[i] = 1000;
    }
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
      r = 255;
      g = 255;
      b = 255;
      a = 10;
      break;

    case 1:
      r = asteroid.dist(asteroid.pPos)*8;
      g = 40;
      b = 80;
      break;

    case 2:
      r = (asteroid.x/width)*255;
      g = (asteroid.y/height)*255;
      b =255-(asteroid.x/width)*127-(asteroid.x/width)*127;
      break;

      //case 3:
      //  break;
    default:
      r = asteroid.dist(asteroid.pPos)*8;
      g = 40;
      b = 80;
      break;
    }
    stroke(r, g, b, a);
    //println(r + " " + asteroid.x + " " + asteroid.y + " " + asteroid.dist(asteroid.pPos) + " " + currentSchemeID);
  }
  int getTotalParticles() {
    return totalParticles[currentSchemeID];
  }
}

