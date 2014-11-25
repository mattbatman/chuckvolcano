SinOsc s => dac;
SinOsc t => dac;

// Intro
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
0.05::second => noteSeparation;

// Turn main gain s on and secondary gain t off
0 => t.gain;
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

// split lowAFlat and aflat
0.3 => t.gain;
Std.mtof(lowAFlat) => t.freq;
Std.mtof(aflat) => s.freq;
1.5::second => now;
0 => t.gain;

// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;

// split lowAFlat and aflat
0.3 => t.gain;
Std.mtof(lowAFlat) => t.freq;
Std.mtof(aflat) => s.freq;
1.5::second => now;
0 => t.gain;




// End Intro







Std.mtof(aflat) => s.freq;
1.5::second => now;

// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;

Std.mtof(aflat) => s.freq;
1.5::second => now;

// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;







// Main Loop

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(lowAFlat) => s.freq;
0.5::second => now;
// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;
}

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(gflat) => s.freq;
1::second => now;
// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;
}

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(eflat) => s.freq;
0.5::second => now;
// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;
}

for(0 => int foo; foo < 3; foo++)
{
Std.mtof(aflat) => s.freq;
0.5::second => now;
// note separation
0 => s.gain;
noteSeparation => now;
0.3 => s.gain;
}


for(0 => int foo; foo < 3; foo++)
{
    Std.mtof(lowAFlat) => s.freq;
    0.5::second => now;
    // note separation
    0 => s.gain;
    noteSeparation => now;
    0.3 => s.gain;
}

for(0 => int foo; foo < 3; foo++)
{
    Std.mtof(gflat) => s.freq;
    1::second => now;
    // note separation
    0 => s.gain;
    noteSeparation => now;
    0.3 => s.gain;
}

for(0 => int foo; foo < 3; foo++)
{
    Std.mtof(f) => s.freq;
    1::second => now;
    // note separation
    0 => s.gain;
    noteSeparation => now;
    0.3 => s.gain;
}


// Personal Notes
// TriOsc is smoothest
// Sqrosc is grittiest
// SawOsc is fuzziest 