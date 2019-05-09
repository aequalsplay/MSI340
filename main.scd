// Set up Output Device
// // // // // // // // // // // // // //
Ndef.clear;
OSCdef.clear;

ServerOptions.devices;

Server.local.options.numOutputBusChannels = 6;
Server.local.options.numOutputBusChannels;
s.meter;

s.options.device_("Built-in Output");
s.options.device_("Soundflower (64ch)");
s.options.device_("Loopback Audio 2");
s.options.device_("Fireface 400 (F55)");
s.options.device_("Scarlett 18i20 USB");


s.options.blockSize_(1025);
s.options.hardwareBufferSize_(1025);

s.reboot;
s.meter;

NdefMixer(s);



// PanZ: set number of outs
~out = 6;

// OSC Parsing


NdefMixer(s);


Ndef(\1).clear;


(

Ndef(\1, {var sig = SinOsc.ar(cos(Ndef.kr(\aBoidPosY, 1))+Ndef.kr(\aBoidPosX, 1)); sig = Decay2.ar(sig, 0.01, 0.2, 0.1)*0.0005; Pan2.ar(sig, 0.0)}).play;


)
// Boid Ndefs to play
s.meter;

NdefMixer(s);

Ndef(\rytm,{var r=8,fq=Duty.ar(8/r,0,Ndef.kr(\aBoidVel, 1)*0.1);Saw.ar(fq)*Decay2.ar(Impulse.ar(r),1/r,0.2,0.1)*0.002!2;}).play;

Ndef(\rytm1,{var r=WhiteNoise(Ndef.kr(\bBoidVel, 1)*2),fq=Duty.ar(1*r,0,1);Saw.ar(fq)*Decay2.ar(Impulse.ar(r),8/r,0.1)*0.002!2}).play;

Ndef(\rytm2,{var r=Ndef.kr(\cBoidVel, 1)*2,fq=Duty.ar(1/r,0,8);Saw.ar(fq)*Decay2.ar(Impulse.ar(r),2/r,0.5, 0.1)*0.01!2}).play;

Ndef(\rytm3,{var r=Ndef.kr(\dBoidPosY, 1),fq=Duty.ar(1/r,0,16);Saw.ar(fq)*Decay2.ar(Impulse.ar(r),1/r,0.2)*0.01!2}).play;

Ndef(\rytm4,{var r=Ndef.kr(\eBoidPosY, 1),fq=Duty.ar(1/r,0,2);Saw.ar(fq)*Decay2.ar(Impulse.ar(r),3/r,0.2)*0.01!2}).play;

Ndef(\rytm5,{var r=Ndef.kr(\fBoidVel, 1)*0.75,fq=Duty.ar(1/r,0,3);Saw.ar(fq)*Decay2.ar(Impulse.ar(r),1/r,0.02)*0.01!2}).play;


// 2
// Ndef(\deepsine, {Pan2.ar(SinOsc.ar(Ndef.kr(\fBoidPosX), mul:0.2), 0.0)}).play;

//3
Ndef(\gran, {inf.do{
	Synth(\shortsample,[\buffer,c, \amp, {0.1.rand}, \pos,{1.0.rand},\cutoff, {5000.rand},\dur,{2.0.rand}]);
	0.05.wait;
}
}.fork;
).play;

// 4
Ndef(\gran2, {{
inf.do{
			Synth(\sfgrain,[\bufnum, b.bufnum, \dur, {10.0.rand}, \startPos,{1.0.rand},\amp, exprand(0.005,0.01), \pan, 1.0.rand2]);
0.05.wait;
}
}.fork;
}).play;



// BORN
(

OSCdef(\yes, {
	arg msg;
	// msg.postln;
	Ndef(\born).set(\val, msg[1]);

	Ndef(\arpy,{ var a,fq,tr;a=Dseq([2, 65, 73, 120, 32],1);tr=Impulse.ar({100.rand + 10}); 	fq=Demand.ar(tr, 0,a)*20;Pan2.ar(SinOsc.ar(fq)* EnvGen.kr(Env.perc(0.01, 0.3), doneAction:2) *0.2,rrand(-1.0, 1.0))}).play;

}, "/born");

)

