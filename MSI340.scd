// Set up Output Device
// // // // // // // // // // // // // //

ServerOptions.devices;
s.options.device_("Built-in Output");
s.options.device_("Soundflower (64ch)");
s.options.device_("Loopback Audio 2");
s.options.device_("Fireface 400 (F55)");

s.options.blockSize_(1025);
s.options.hardwareBufferSize_(1025);

s.reboot;
s.meter;

// Set up SynthDefs
// // // // // // // // // // // // // //

(

// Declare name for Sine Grain Synth
SynthDef(\sinegrain, {arg pan, freq, amp; var grain;

grain= SinOsc.ar(freq, 0, amp)*(XLine.kr(1.001,0.001,0.1,doneAction:2)-0.001);

Out.ar(0,Pan2.ar(grain, pan))}).add;

// Declare name for Band-pass Filter Saw Synth
SynthDef(\bpfsaw, {

	// Set default arguments
	arg atk=2, sus=0, rel=3, c1=1, c2=(-1),
	freq = 300, freq2 = 150, detune=0.2, pan=0, cfhzmin=0.1, cfhzmax=0.3,
	cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, gate=0,
	lsf=200, ldb=0, out=0, amp=0.2, osc=2;

	// Add variables
	var sig, env;

	// Add envelope, set paramters
	env = EnvGen.kr(Env([0,1,1,0], [atk, sus, rel], [c1, 0, c2]), gate, doneAction:2)!2;

	// Choose Wave type (Tri, SyncSawtooth, Sine)
	sig = Mix.fill(3,
	[
	LFTri.ar(freq * {LFNoise1.kr(0.5,detune).midiratio}, mul: 0.2),

	SyncSaw.ar(freq / 2 * {LFNoise1.kr(0.5,detune).midiratio}, freq2 * {LFNoise1.kr(0.5,detune).midiratio}, mul: 0.2),

	SinOsc.ar(freq + 200 * {LFNoise1.kr(0.5,detune).midiratio}, mul: 0.2),
	]);

	// Add Moog-style filter (modulate cutoff and resonance)
	sig = MoogFF.ar(
		sig,
		{LFNoise1.kr(
			LFNoise1.kr(4).exprange(cfhzmin,cfhzmax)
		).exprange(cfmin, cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin, rqmax)}!2,
	);

	// Add low-shelf filter
	sig = BLowShelf.ar(sig, lsf, 0.5, ldb);

	// Stereo-panning
	sig = Balance2.ar(sig[0], sig[1], pan);

	// Multiply signal, by envelope, by amp
	sig = sig * env * amp;

	// Output signal, start the channel array from channel 0
	Out.ar(out, sig);

	// Add SynthDef to server
}).add;



// Alarm Synth

// Declare name for alarm synth
SynthDef(\alarm, {

	// Add default arguments
	arg length=0.01, freqs=#[600,800,600,800], color=1, repeats=inf, pan=0.0;

	// Add variables
	var freq, out, operations;

	// Length = duration (time values), 0 = reset, Dseq = advance through 'freq' array, demanding output values - repeat infinitely, doneAction: 2 = release Synth when duration stream ends
	freq = Duty.ar(length, 0, Dseq(freqs, repeats), doneAction: 2);

	// Send signal through low-pass filter, set cuttof to 70hz
	freq = LPF.ar(freq, 70);

	// Filter out DC bias / DC coefficient - take mean of the amplitude of the waveform
	out = LeakDC.ar(SinOsc.ar(freq));

	// Select 'color' for signal
	out = Select.ar(color, [out, (out * pi).sin, (out * pi).cos, ((out+0.25) * pi).cos]);

	// Add output U-gen, starting at channel array 0, add stereo-panning
	Out.ar(0, Pan2.ar(out * 0.1, pan))
}).add;
)



// Set up OSC
// // // // // // // // // // // // // //



// Test if OSC is being received - change to false to turn off
o = OSCFunc.trace(true);

// Set up OSC path: freq/1.0 - take OSC 'msg' and save to ~oscMsg1 variable

(
OSCdef(\1, {
	arg msg;
	msg.postln;

// Pdef Pads

			// Generative pattern for band-pass filter saw synth, randomises most values, outputs MIDI notes to the Synth

	Pbindef(\pads,
	\instrument, \bpfsaw,
	\dur, Pwhite(msg[1], msg[1]+ 2, inf),
	\stretch, Pwhite(0.1, 2, inf),
	\midinote, Pxrand(
			[
			Pxrand([23, 35, 54, 63, 64], inf),
			Pxrand([45, 52, 54, 4, 59, 61], inf),
			Pxrand([23, 35, 54, 16, 64], inf),
			Pxrand([23, 35, 54, 63], inf),
			Pxrand([16, 28, 40, 47, 56, 59], inf),
			Pxrand([42, 52, 57, 61, 63], inf),
	], inf),
	// Detune oscillators
	\detune, Pexprand(0.05, 0.2, inf),
	// Set Moog cutoff filter max and min
	\cfmin, 100,
	\cfmax, Pwhite(msg[1] + 100, 300, inf),

	\c1, Pwhite(0.1, 10, inf),
	\c2, Pwhite(0.1, 10, inf),
	// Set Moog filter resonance max and min
	\rqmin, Pexprand(0.01, 0.15, inf),
	\rqmax, Pexprand(0.15,0.25, inf),
	// Set envelope
	\atk, Pwhite(2.0, 2.5, inf),
	\sus, Pwhite(0.5, 1, inf),
	\rel, Pwhite(6.5, 10.0, inf),
	// Set low-shelf filter
	\ldb, 4,
	// Set amplitude
	\amp, 0.2,
	// Set output array to start at channel 0
	\out, 0,
	// Stereo-panning according to white-noise
	\pan, Pwhite(-1.0,1.0, inf),
	// Play stream
).play;
	// Save Pbindef to global variable
	~oscMsg1 = msg;
	// Listen to OSC path: '/freq1.0'
}, "/freq1.0");
)


// Set up OSC path: freq/2.0 - take OSC 'msg' and save to ~oscMsg2 variable
(
OSCdef(\2, {
	arg msg;
	msg.postln;
	// Add Ndef (proxy-space)
	Ndef(\gnd,{
				// Send signal through low-pass filter
				LPF.ar(
					// Add Gendy (stochastic synthesis u-gen, based on xennakis' work)
					Gendy1.ar(
						// Probability distribution type: 0=linear, 1=cauchy, 2=logist, 3=hyperbcos, 4=arcsine, 5=expon, 6=sinus
						2,
						// 'Choice of distribution for the perturbation of the current inter control point duration.'
						4,
						// Set minimum frequency to OSC message at index 1 * 2 to double freq
						minfreq: msg[1] * 2,
						// Max frequency = 800hz
						maxfreq: 800,
						// Multiple by 0.3 to attenuate signal
						mul:0.3),
					// Set cutoff for low-pass filter
					msg[1],
					// Attenuate signal
					0.2)
				// Force stereo
				!2}
			// Play Ndef
			).play;
	// Synth(\bpfsaw, [\sus, 0.01, \freq, msg[1] + 420]);

	// Save OSC messagge to global variable ~oscMsg2
	~oscMsg2 = msg;
	// Set OSC path to '/freq2.0'
}, "/freq2.0");
)

(
OSCdef(\3, {
	arg msg;
	msg.postln;
	// Set bpfsaw Synth frequency to OSC message at index 1, on OSC path '/freq3.0'
	Synth(\bpfsaw, [\sus, 0.01, \amp, 0.1, \freq, msg[1] + floor(rrand(110, (265.. 220)))]);
	// Save OSC msg to global variable '~osvcMsg3
	~oscMsg3 = msg;
	// Set OSC path to '/freq3.0
}, "/freq3.0");
)

(
OSCdef(\4, {
	arg msg;
	msg.postln;

	Ndef(\rytm,{var r=8,fq=Duty.ar(8/r,0,rrand(4,16));Saw.ar(fq,0.4)*Decay2.ar(Impulse.ar(r),1/r,0.2)!2}).play;
	~oscMsg4 = msg;
}, "/freq4.0");
)

(
OSCdef(\5, {
	arg msg;
	msg.postln;
	Ndef(\rytm).stop;
	~oscMsg5 = msg;
}, "/freq5.0");
)




(
OSCdef(\6, {
	arg msg;
	msg.postln;
	// Set name
	Ndef(\bSw,{
		// Signal through low-pass filter
		LPF18.ar(
			// Signal is sync sawtooth synth
			SyncSaw.ar(
				// Fundamental requency is random number between 0 + 50
				{50.rand},
				// Frequency of 'slave-synced sawtooth wave' = OSC msg * 2
				msg[1]*2,
				// Attenuate signal
				0.1),
			// Set lpfilter cutoff
			200,
			// Set lpfilter resonance
			0.4,
			// Attenuate signal
			0.3)
		// Force multi-channel (stereo)
		!2
		// Play Ndef
	}).play;
	// Save OSC message to global variable ~oscMsg6
	~oscMsg6 = msg;
	// Set osc path to '/freq6.0
}, "/freq6.0");
)

// Stop Ndef above
(
OSCdef(\7, {
	arg msg;
	msg.postln;
	Ndef(\bSw).stop(4);
	~oscMsg7 = msg;
}, "/freq0.0");
)


// Sound used for when new boids are created - osc path /'born'
(
OSCdef(\born, {
	arg msg;
	msg.postln;
	// Set name to \arpy
	Ndef(\arpy,{
		// Set up variables
		var a,fq,tr;
		// Set a to demand-rate sequencer, fill array, repeat 1 time
		a=Dseq([2, 65, 73, 120, 32],1);
		// Set tr to Impulse generator, set freq to random number between 10 and 110
		tr=Impulse.ar({100.rand + 10});
		// Set fq to demand u-gen, demand time values from Dseq (a) - multiply result by 20
		fq=Demand.ar(tr, 0,a)*20;
		// Stereo-panning
		Pan2.ar(
			// Sine oscillator with Demand u-gen setting freq.
			SinOsc.ar(fq)
			// Multiply by value of percussive envelope, release synth when done.
			* EnvGen.kr(Env.perc(0.01, 0.3), doneAction:2)
			// Attenuate signal
			*0.2,
			// Set pan to center
			0.0)
		// Force multi-channel (stereo)
		!2
		// Play Ndef
	}).play;
	// Save OSC message to global variable ~born
	~born = msg;
	// Set OSC to path '/born'
}, "/born");
)


// Miscellaneous Experiments (not in use)
// // // // // // // // // // // // // //



Ndef(\blip, {arg amp=0.2; var sig, env; sig=Blip.ar(660, 200, 0.2); env=Env.perc(0.01, 0.6, 0.2); sig = sig * env * amp; Out.ar(0, sig)}!2).play;

NdefMixer(s);

s.meter;
Synth(\dsaf_multialarm, [\length, [0.03, 0.2].choose, \freqs, [400, 125, 0, 0], \timbre, [0, 1, 2, 3].choose, \repeats, [10, 40, 20, 60, 80, 20].choose, \pan, {300.rand}.linlin(200, 300, -1.0, 1.0)]);



	Ndef(\dust, {arg pan=0.0; var sig, env; env=Env.perc(0.03, 0.5, 0.3, 'exponential'); sig=SyncSaw.ar([210, 220, 110, 105, 160, 320] * Dust.ar(1000), 210, 0.2); sig=LPF.ar(sig, 500, 0.2); sig=Pan2.ar(sig, pan);
	grain = FMGrainB.ar(Impulse.kr(10), {10.rand}, 210, 20, 1, sig, 0.2);

	Out.ar(0, sig)*0.2}).play;
	// NDef(\blip, {var sig; sig=Blip.ar(660, msg[1], 0.2) * Env.perc(0.01, 0.6, 0.2); Out.ar(0, sig)}!2).play;








