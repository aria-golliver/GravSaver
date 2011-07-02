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

  void newScheme(int = schemeID) {
    currentScheme = floor(random(0,totalSchemes));
  }

  void setStroke(Asteroid a) {
    /*
     * switch statement to figure out what r/g/b/a to set
     * POSSIBLE SCHEMES
     * based on x,y pos
     * transparent lines
     * distance from planets
     * "heat map"
     */
    float r = 0;
    float g = 0;
    float b = 0;
    float a = 0;

    stroke(r, g, b, a);
  }
  int getTotalParticles(){
    return totalParticles[currentSchemeID];
  }
}

