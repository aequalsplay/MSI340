// Object

(

OSCdef(\object, {
	arg msg;
	// msg.postln;
	Ndef(\objPosX).set(\val, msg[1]);
	Ndef(\objPosY).set(\val, msg[2]);
	Ndef(\objVel).set(\val, msg[3]);
}, "/oscObj");

)

(

// Object Ndefs

Ndef(\objPosX, {
	arg val = 0;
	var sig;
	sig = val;

});

Ndef(\objPosY, {
	arg val = 0;
	var sig;
	sig = val;
});

Ndef(\objVel, {
	arg val = 0;
	var sig;
	sig = val;
	sig = val.linlin(-4000, 4000, 0, 4000);
});


)
(


// OBject Ndefs to play

Ndef(\bSw,{
	var sig, out;
	sig = HPF.ar(SyncSaw.ar(Ndef.kr(\objPosY)*0.02,Ndef.kr(\objPosX), 0.2),100, 0.4);
	out = PanX.ar(6, sig, 0.5);
}).play;
	// Set name to \arpy

Ndef(\gndy,{HPF.ar(Gendy1.ar(5,4,1,50,{200.rand}),Ndef.kr(\objVel, 1)/4,0.03)!2}).play;
)