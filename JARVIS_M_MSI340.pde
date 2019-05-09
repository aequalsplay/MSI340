import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress supercollider; 

System s;
Boid b;

void setup() {
    // OSC SETUP
  osc = new OscP5(this, 12000);
  supercollider = new NetAddress("127.0.0.1", 57120);
  fullScreen(P2D, 1);
  //size(640, 320, P2D);
  s = new System(7, 30);
}

void draw() {
  background(0);
   s.runFood();
   s.runBoids();
   s.runObject();
   

  //println(frameRate);
}
