class ColorSchemer {
  private int          currentSchemeID;
  private final int    totalSchemes = 4;
  private int[]        totalParticles;

  ColorSchemer() {
    totalParticles = new int[totalSchemes];
    currentSchemeID = 0;
    for (int i = 0; i<totalParticles.length; i++) {
      totalParticles[i] = 1000;
    }
  }

  void newScheme() {
    currentScheme = floor(random(0, totalSchemes));
  }

  void setStroke(Asteroid a) {
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
      r = a.dist(a.pPos)*8;
      g = 40;
      b = 80;
      break;

    case 2:
      r = (a.x/width)*255;
      g = (a.y/height)*255;
      b =255-(a.x/width)*127-(a.x/width)*127);
      break;

      //case 3:
      //  break;
    default:
      r = a.dist(a.pPos)*8;
      g = 40;
      b = 80;
      break;

      stroke(r, g, b, a);
    }
    int getTotalParticles() {
      return totalParticles[currentSchemeID];
    }
  }
}
