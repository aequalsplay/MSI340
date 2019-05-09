(
// Boid 1

Ndef(\aBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 1, 30);
});
Ndef(\aBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linexp(-1, 1, 10, 20);
});
Ndef(\aBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-10, 10, 0, 16);
});
Ndef(\aBoidR, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 0, 10);
});


// Boid 2

Ndef(\bBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 1, 30);
});
Ndef(\bBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 10, 20);
});
Ndef(\bBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-10, 10, 0, 16);
});
Ndef(\bBoidR, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 0, 10);
});

// Boid 3

Ndef(\cBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 1, 30);
});
Ndef(\cBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 10, 20);
});
Ndef(\cBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-10, 10, 0, 16);
});
Ndef(\cBoidR, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 0, 10);
});

// Boid 4

Ndef(\cBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 1, 30);
});
Ndef(\cBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 10, 20);
});
Ndef(\cBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-10, 10, 0, 16);
});
Ndef(\cBoidR, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 0, 10);
});

// Boid 5

Ndef(\eBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 1, 30);
});
Ndef(\eBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 10, 20);
});
Ndef(\eBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-10, 10, 0, 16);
});
Ndef(\eBoidR, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 0, 10);
});

// Boid 6

Ndef(\fBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 1, 30);
});
Ndef(\fBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 10, 20);
});
Ndef(\fBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-10, 10, 0, 16);
});
Ndef(\fBoidR, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1, 1, 0, 10);
});

// Boid 7

Ndef(\gBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\gBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\gBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\gBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 8

Ndef(\hBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\hBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\hBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\hBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 9

Ndef(\iBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\iBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\iBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\iBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 10

Ndef(\jBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\jBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\jBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\jBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 11

Ndef(\kBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\kBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\kBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\kBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 12

Ndef(\lBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\lBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\lBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\lBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 13

Ndef(\mBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\mBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\mBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\mBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});


// Boid 14

Ndef(\nBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\nBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\nBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\nBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 15

Ndef(\oBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\oBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\oBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\oBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 16

Ndef(\pBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\pBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\pBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\pBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 17

Ndef(\qBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\qBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\qBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\qBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});


// Boid 18

Ndef(\rBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\rBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\rBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\rBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});

// Boid 19

Ndef(\sBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\sBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\sBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\sBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});


// Boid 20

Ndef(\tBoidPosX, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\tBoidPosY, {
	arg val = 0;
	var sig;
	sig = val;
});
Ndef(\tBoidVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-1000, 1000, 0, 60);
});
Ndef(\tBoidR, {
	arg val = 0;
	var sig;
	sig = val;
});



)