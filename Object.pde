     
      
class Object {
        PVector pos;
        PVector vel;
        PVector acc;
        float mass = 200;
        float outerRad = 80;
        float innerRad = 20;
        float px = 0, py = 0, angle = 0;
        float pts = random(360);
        float rot = 360.0/pts;
        float maxSpeed;
        float maxForce;
        
        String oscPath;
   
        float oscPosX;
        float oscPosY;
        float oscVel;

       
      Object() {// TRIANGLE_STRIP Mode    
        pos = new PVector(width/2, height/2);     
        acc = new PVector(0, 0);
        vel = new PVector(0, 0);
        maxSpeed = 2;
        maxForce = 1; 
        
        push();
        
        oscPath = "/oscObj";
        strokeWeight(4); 
        
        pop();
        
    }
     
    
      void update() {
        vel.add(acc);
        vel.limit(maxSpeed);
        pos.add(vel);
        acc.mult(0);
        
        oscPosX = map((pos.x), 0, width, 1, 20);
        oscPosY = map((pos.y), 0, height, 20, 1);
        oscVel = map((vel.y), -1, 1, 1, 4000);
        osc();
      }
      
      
      void display(){
        
         pushMatrix(); 
           
         //stroke(255, 200);
       beginShape(TRIANGLE_STRIP);
       //scale(2);
      for (int i = 0; i < pts; i++) {
        px = pos.x+cos(radians(angle))*outerRad;
        py = pos.y+sin(radians(angle))*outerRad;
          vertex(px, py);
          angle+=rot;
        px = pos.x+cos(radians(angle))*innerRad;
        py = pos.y+sin(radians(angle))*innerRad;
          vertex(px, py);
          angle+=rot; 
        
        //pts = noise(random(360)) + random(360);
        innerRad  = cos(random(10)) + 10;
        outerRad  = sin(random(80)) * 80;
        py = random(30);
        angle = random(360);

      }
      
      endShape(CLOSE);
    
    popMatrix();
        
   }
   

     
     void applyForce(PVector force) {
       PVector f = force.div(mass);
        acc.add(f);
       }
   
  void seek(ArrayList<Boid> boids) {
   
    float desiredseparation = outerRad*4;
    PVector steer = new PVector();
    int count = 0;
    
  
    for (int i = boids.size()-1; i >= 0; i--) {
      Boid b = boids.get(i);
      float d = PVector.dist(pos, b.pos);
      PVector desired = PVector.sub(pos, b.pos);
     
      if ((d > 0) && (d > desiredseparation)) {
        // Calculate vector pointing away from neighbour
        PVector steering = PVector.sub(desired, vel);
        steering.normalize();
        steering.div(d);        // Weight by distance
        steer.sub(steering);
        count++;   // Keep track of how many
      }
    }
    
    if (count > 0) {
      steer.div(count);
      
      steer.normalize();
      steer.mult(maxSpeed);
     
      steer.sub(vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
    
  }
  
  
  
  
   // Wraparound
  void borders() {
    if (pos.x < 0) pos.x = 0;
    if (pos.y < 0) pos.y = 0;
    if (pos.x > width) pos.x = width;
    if (pos.y > height) pos.y = height;
  }

// OSC STUFF  
    void osc(){
    
    OscMessage objectOSC = new OscMessage(oscPath);
    objectOSC.add(oscPosX);
    objectOSC.add(oscPosY);
    objectOSC.add(oscVel);
    //println(oscVel);
    osc.send(objectOSC, supercollider);
 
   
   
}
}
