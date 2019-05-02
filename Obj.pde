     
      
class Obj {
      PVector position;
      float outerRad = 80;
      float innerRad = 20;
      float px = 0, py = 0, angle = 0;
      float pts = random(360);
      float rot = 360.0/pts;
      
      Obj(float x, float y) {// TRIANGLE_STRIP Mode    
      position = new PVector(x, y);
      
      
}
     
     
      
      void display(){

       beginShape(TRIANGLE_STRIP);
      for (int i=0; i<pts; i++) {
        px = position.x+cos(radians(angle))*outerRad;
        py = position.y+sin(radians(angle))*outerRad;
        angle+=rot;
        vertex(px, py);
        px = position.x+cos(radians(angle))*innerRad;
        py = position.y+sin(radians(angle))*innerRad;
        vertex(px, py);
        angle+=rot;
        innerRad  = cos(100);
        //pts = noise(random(36)) * random(36);
        py = random(36);
        angle = random(360);
      }
      endShape();
      
      
      }
}
