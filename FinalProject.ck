// No Copyright.
// This is an attempt to emulate/recreate/"cover"
// Truth Ray by Thom Yorke

SinOsc s => dac;
SinOsc t => dac;
SinOsc u => dac;

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

fun void separateNotes() {
    0 => s.gain;
    noteSeparation => now;
    0.3 => s.gain;
    }

// INTRO

// Turn main gain s on and secondary gain t off
0 => t.gain;
0 => u.gain;
0.3 => s.gain;

// Begin intro
Std.mtof(lowAFlat) => s.freq;
1.5::second => now;

Std.mtof(aflat) => s.freq;
2.5::second => now;

Std.mtof(dflat) => s.freq;
1::second => now;

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
1.5::second => now;

Std.mtof(aflat) => s.freq;
2.5::second => now;

// split lowAFlat and aflat plus dflat
0.3 => t.gain;
0.3 => u.gain;
Std.mtof(lowAFlat) => t.freq;
Std.mtof(aflat) => s.freq;
Std.mtof(dflat) => u.freq;
1.5::second => now;
0 => t.gain;
0 => u.gain;

// note separation
separateNotes();

// split lowAFlat and aflat plus dflat
0.3 => t.gain;
0.3 => u.gain;
Std.mtof(lowAFlat) => t.freq;
Std.mtof(aflat) => s.freq;
Std.mtof(dflat) => u.freq;
1.5::second => now;
0 => t.gain;
0 => u.gain;



// End Intro







Std.mtof(aflat) => s.freq;
1::second => now;

// note separation
separateNotes();

Std.mtof(aflat) => s.freq;
1::second => now;

// note separation
separateNotes();







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