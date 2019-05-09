// Boids
(

OSCdef(\boid1, {
	arg msg;
	// msg.postln;
	Ndef(\aBoidPosX).set(\val, msg[1].sin);
	Ndef(\aBoidPosY).set(\val, msg[2].sin);
	Ndef(\aBoidVel).set(\val, msg[3].sin);
	Ndef(\aBoidR).set(\val, msg[4].sin);
}, "/boid1.0");

OSCdef(\boid2, {
	arg msg;
	// msg.postln;
	Ndef(\bBoidPosX).set(\val, msg[1]);
	Ndef(\bBoidPosY).set(\val, msg[2]);
	Ndef(\bBoidVel).set(\val, msg[3]);
	Ndef(\bBoidR).set(\val, msg[4]);
}, "/boid2.0");

OSCdef(\boid3, {
	arg msg;
	// msg.postln;
	Ndef(\cBoidPosX).set(\val, msg[1]);
	Ndef(\cBoidPosY).set(\val, msg[2]);
	Ndef(\cBoidVel).set(\val, msg[3]);
	Ndef(\cBoidR).set(\val, msg[4]);
}, "/boid3.0");

OSCdef(\boid4, {
	arg msg;
	// msg.postln;
	Ndef(\dBoidPosX).set(\val, msg[1]);
	Ndef(\dBoidPosY).set(\val, msg[2]);
	Ndef(\dBoidVel).set(\val, msg[3]);
	Ndef(\dBoidR).set(\val, msg[4]);
}, "/boid4.0");

OSCdef(\boid5, {
	arg msg;
	// msg.postln;
	Ndef(\eBoidPosX).set(\val, msg[1]);
	Ndef(\eBoidPosY).set(\val, msg[2]);
	Ndef(\eBoidVel).set(\val, msg[3]);
	Ndef(\eBoidR).set(\val, msg[4]);
}, "/boid5.0");

OSCdef(\boid6, {
	arg msg;
	// msg.postln;
	Ndef(\fBoidPosX).set(\val, msg[1]);
	Ndef(\faBoidPosY).set(\val, msg[2]);
	Ndef(\fBoidVel).set(\val, msg[3]);
	Ndef(\fBoidR).set(\val, msg[4]);
}, "/boid6.0");

OSCdef(\boid7, {
	arg msg;
	// msg.postln;
	Ndef(\gBoidPosX).set(\val, msg[1]);
	Ndef(\gBoidPosY).set(\val, msg[2]);
	Ndef(\gBoidVel).set(\val, msg[3]);
	Ndef(\gBoidR).set(\val, msg[4]);
}, "/boid7.0");

OSCdef(\boid8, {
	arg msg;
	// msg.postln;
	Ndef(\hBoidPosX).set(\val, msg[1]);
	Ndef(\hBoidPosY).set(\val, msg[2]);
	Ndef(\hBoidVel).set(\val, msg[3]);
	Ndef(\hBoidR).set(\val, msg[4]);
}, "/boid8.0");

OSCdef(\boid9, {
	arg msg;
	// msg.postln;
	Ndef(\iBoidPosX).set(\val, msg[1]);
	Ndef(\iBoidPosY).set(\val, msg[2]);
	Ndef(\iBoidVel).set(\val, msg[3]);
	Ndef(\iBoidR).set(\val, msg[4]);
}, "/boid9.0");

OSCdef(\boid10, {
	arg msg;
	// msg.postln;
	Ndef(\jBoidPosX).set(\val, msg[1]);
	Ndef(\jBoidPosY).set(\val, msg[2]);
	Ndef(\jBoidVel).set(\val, msg[3]);
	Ndef(\jBoidR).set(\val, msg[4]);
}, "/boid10.0");

OSCdef(\boid11, {
	arg msg;
	// msg.postln;
	Ndef(\kBoidPosX).set(\val, msg[1]);
	Ndef(\kBoidPosY).set(\val, msg[2]);
	Ndef(\kBoidVel).set(\val, msg[3]);
	Ndef(\kBoidR).set(\val, msg[4]);
}, "/boid11.0");

OSCdef(\boid12, {
	arg msg;
	// msg.postln;
	Ndef(\lBoidPosX).set(\val, msg[1]);
	Ndef(\lBoidPosY).set(\val, msg[2]);
	Ndef(\lBoidVel).set(\val, msg[3]);
	Ndef(\lBoidR).set(\val, msg[4]);
}, "/boid12.0");

OSCdef(\boid13, {
	arg msg;
	// msg.postln;
	Ndef(\mBoidPosX).set(\val, msg[1]);
	Ndef(\mBoidPosY).set(\val, msg[2]);
	Ndef(\mBoidVel).set(\val, msg[3]);
	Ndef(\mBoidR).set(\val, msg[4]);
}, "/boid13.0");

OSCdef(\boid14, {
	arg msg;
	// msg.postln;
	Ndef(\nBoidPosX).set(\val, msg[1]);
	Ndef(\nBoidPosY).set(\val, msg[2]);
	Ndef(\nBoidVel).set(\val, msg[3]);
	Ndef(\nBoidR).set(\val, msg[4]);
}, "/boid14.0");

OSCdef(\boid15, {
	arg msg;
	// msg.postln;
	Ndef(\oBoidPosX).set(\val, msg[1]);
	Ndef(\oBoidPosY).set(\val, msg[2]);
	Ndef(\oBoidVel).set(\val, msg[3]);
	Ndef(\oBoidR).set(\val, msg[4]);
}, "/boid15.0");

OSCdef(\boid16, {
	arg msg;
	// msg.postln;
	Ndef(\pBoidPosX).set(\val, msg[1]);
	Ndef(\pBoidPosY).set(\val, msg[2]);
	Ndef(\pBoidVel).set(\val, msg[3]);
	Ndef(\pBoidR).set(\val, msg[4]);
}, "/boid16.0");

OSCdef(\boid17, {
	arg msg;
	// msg.postln;
	Ndef(\qBoidPosX).set(\val, msg[1]);
	Ndef(\qBoidPosY).set(\val, msg[2]);
	Ndef(\qBoidVel).set(\val, msg[3]);
	Ndef(\qBoidR).set(\val, msg[4]);
}, "/boid17.0");

OSCdef(\boid18, {
	arg msg;
	// msg.postln;
	Ndef(\rBoidPosX).set(\val, msg[1]);
	Ndef(\rBoidPosY).set(\val, msg[2]);
	Ndef(\rBoidVel).set(\val, msg[3]);
	Ndef(\rBoidR).set(\val, msg[4]);
}, "/boid18.0");

OSCdef(\boid19, {
	arg msg;
	// msg.postln;
	Ndef(\sBoidPosX).set(\val, msg[1]);
	Ndef(\sBoidPosY).set(\val, msg[2]);
	Ndef(\sBoidVel).set(\val, msg[3]);
	Ndef(\sBoidR).set(\val, msg[4]);
}, "/boid19.0");

OSCdef(\boid20, {
	arg msg;
	// msg.postln;
	Ndef(\tBoidPosX).set(\val, msg[1]);
	Ndef(\tBoidPosY).set(\val, msg[2]);
	Ndef(\tBoidVel).set(\val, msg[3]);
	Ndef(\tBoidR).set(\val, msg[4]);
}, "/boid20.0");



)
