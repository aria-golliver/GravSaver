class ParticleGenerator{
  /* 
   * generates particles
   * generates planets
   * positions both
   * resets screen after certian number of resets
   */
   
   void resetGenerator(){
     //corner = rand(0,3);
     //call colorschemer.newScheme()
     //asteroids = asteroid[color.getTotal]
     //planets = planet[8?]
     noStroke();
     fill(0);
     rect(0,0,width,height);
     resetAsteroids();
     resetPlanets();
   }
   
   void resetAsteroids(){
     /*
      * for i in asteroids
      * switch(corner)
      * asteroid[i].set(corner.x,corner.y,0);
      * vel = random in circle
      * acc = 0;
      * resets--;
      */
   }
   
   void resetPlanets(){
      /*
      * for i in planets
      * position planets
      * have planets avoid corners!
      */
   }
   
   void update(){
     /*
      * for i in asteroids
      * asteroid[i].update(planets);
      * check if any asteroid is still alive
      * if not -> reset generator
      */
   }
   
   void draw(){
     /*
      * for i in asteroids
      * asteroid[i].draw();
      */
   }
  
}
