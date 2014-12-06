// No Copyright.
// This is an attempt to emulate/recreate/"cover"
// Truth Ray by Thom Yorke

SinOsc s => dac;
SinOsc t => dac;
SinOsc u => dac;
Gain master => dac;
SndBuf kick1 => master;
SndBuf kick2 => master;
SndBuf kick3 => master;
SndBuf kick4 => master;
SndBuf kick5 => master;

.6 => master.gain;

// load soundfiles into sndbuf
me.dir() + "/audio/kick_01.wav" => kick1.read;
me.dir() + "/audio/kick_02.wav" => kick2.read;
me.dir() + "/audio/kick_03.wav" => kick3.read;
me.dir() + "/audio/kick_04.wav" => kick4.read;
me.dir() + "/audio/kick_05.wav" => kick5.read;

// set all playheads to end so no sound is made
kick1.samples() => kick1.pos;
kick2.samples() => kick2.pos;
kick3.samples() => kick3.pos;
kick4.samples() => kick4.pos;
kick5.samples() => kick5.pos;


// Initialize and assign intro variables
int lowAFlat;
int bflat;
int aflat;
int dflat;
int gflat;
int eflat;
int f;
54 => gflat;
56 => lowAFlat;
58 => bflat;
68 => aflat;
61 => dflat;
63 => eflat;
65 => f;

dur noteSeparation;
0.09::second => noteSeparation;

//DEFINE FUNCTIONS
fun void separateNotes() {
    0 => s.gain;
    noteSeparation => now;
    0.3 => s.gain;
    }
    
fun void quadro(int x) {
Std.mtof(x) => s.freq;
0.75::second => now;

// note separation
separateNotes();

Std.mtof(x) => s.freq;
0.75::second => now;

// note separation
separateNotes();

Std.mtof(x) => s.freq;
0.5::second => now;

// note separation
separateNotes();

Std.mtof(x) => s.freq;
0.75::second => now;

// note separation
separateNotes();
}
//END DEFINE FUNCTIONS



// initialize counter variable
0 => int counter;

// infinite loop
while (true)
{
    // beat goes from 0 to 7 (8 positions)
    counter % 8 => int beat;
    
    // bass drum on 0 and 4
    if ((beat == 0) || (beat == 1) || (beat == 3) || (beat == 5))
    {
        0 => kick2.pos;
    }
    
    // snare drum on 2 and 6
    if ((beat == 4))
    {
        0 => kick1.pos;
    }
 
    counter++; // counter = 1 => counter
    250::ms => now;
}
    
    
    
    
    
    
    

// INTRO

// Turn main gain s on and secondary gain t off
0 => t.gain;
0 => u.gain;
0 => s.gain; // TURN BACK ON

// Begin intro
Std.mtof(lowAFlat) => s.freq;
1.5::second => now;

Std.mtof(aflat) => s.freq;
2.5::second => now;

Std.mtof(dflat) => s.freq;
0.75::second => now;

Std.mtof(lowAFlat) => s.freq;
1.5::second => now;

Std.mtof(aflat) => s.freq;
2.5::second => now;

Std.mtof(dflat) => s.freq;
1.5::second => now;

// split lowAFlat and aflat
0.3 => t.gain;
Std.mtof(lowAFlat) => t.freq;
Std.mtof(aflat) => s.freq;
1.5::second => now;
0 => t.gain;

Std.mtof(lowAFlat) => s.freq;
1::second => now;

Std.mtof(aflat) => s.freq;
2::second => now;

// split lowAFlat and aflat plus dflat
// twice
for (1 => int foo; foo < 3 ; foo++) {
0.3 => t.gain;
0.3 => u.gain;
Std.mtof(lowAFlat) => t.freq;
Std.mtof(aflat) => s.freq;
Std.mtof(dflat) => u.freq;
1::second => now;
0 => t.gain;
0 => u.gain;

// note separation
separateNotes();
} // end for loop

// End Intro

quadro(aflat);

// Main Loop

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(lowAFlat) => s.freq;
0.5::second => now;
// note separation
separateNotes();
}

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(gflat) => s.freq;
1::second => now;
// note separation
separateNotes();
}

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(eflat) => s.freq;
0.5::second => now;
// note separation
separateNotes();
}

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(aflat) => s.freq;
0.5::second => now;
// note separation
separateNotes();
}


for(0 => int foo; foo < 3; foo++)
{
    Std.mtof(lowAFlat) => s.freq;
    0.5::second => now;
    // note separation
    separateNotes();
}

for(0 => int foo; foo < 3; foo++)
{
    Std.mtof(gflat) => s.freq;
    1::second => now;
    // note separation
    separateNotes();
}

for(0 => int foo; foo < 3; foo++)
{
    Std.mtof(f) => s.freq;
    1::second => now;
    // note separation
    separateNotes();
}


// Personal Notes
// TriOsc is smoothest
// Sqrosc is grittiest
// SawOsc is fuzziest 