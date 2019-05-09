//make a SynthDef for a short slice of sound extracted from a buffer starting at chosen position
(
SynthDef(\shortsample,{arg buffer, dur=0.05, pos = 0.0, amp= 0.2, pan= 0.0, cutoff=400, res=0 ;
	var env, source, sig;

	source = PlayBuf.ar(2,buffer,startPos:pos*BufFrames.ir(buffer));

	env = EnvGen.ar(Env([0,1,1,0],[0.01,dur,0.01]),doneAction:2);

	sig = LPF.ar(source, cutoff);

	sig = Pan2.ar(sig, 0.0);

	Out.ar(0,env*sig*amp)

}).add
)

//need a sound file to grab bits of sound from
c = Buffer.read(s,"/Users/mattjarvis/Dropbox/Music Production 2/Misc Recordings/Original/guitar-flutter.wav");

//test the SynthDef:
Synth(\shortsample, [\buffer,c,\pos, {2.0.rand},\dur,0.05]);

//schedule Synths over time, increase duration with count
(
{
inf.do{
		Synth(\shortsample,[\buffer,c,\pos,{1.0.rand},\dur,{2.0.rand}]);
0.05.wait;
}
}.fork;
)


s.meter;
z


NdefMixer(s);

(
SynthDef(\sfgrain, {arg bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04;
var grain;

grain= PlayBuf.ar(2,bufnum, BufRateScale.kr(bufnum), 1, BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(0.01,dur),doneAction:2)-0.001) ;

Out.ar(0,Pan2.ar(grain, pan)*amp)}).add;
)


Synth(\sfgrain).stop;

b = Buffer.read(s, "/Users/mattjarvis/Dropbox/Music Production 2/Samples/Original/WetMouthTappy.wav");

(
{
inf.do{
		Synth(\sfgrain,[\bufnum, b.bufnum, \dur, {4.0.rand}, \startPos,{1.0.rand},\amp, exprand(0.005,0.1), \pan, 1.0.rand2]);
0.05.wait;
}
}.fork;
)



//