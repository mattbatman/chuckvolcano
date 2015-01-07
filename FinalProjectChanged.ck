// Anti-Copyright.
// This is an attempt to emulate/recreate/"cover" Volcano by Beck in Chuck

SinOsc s => dac;
Gain master => dac;
SndBuf kick1 => master;
SndBuf kick5 => master;
SndBuf hihat1 => master;
SndBuf snare1 => master;
SndBuf stereoI => master;
SndBuf robot1 => master;
SndBuf robot2 => master;

0.8 => master.gain;

0 => s.gain;

// load soundfiles into sndbuf
me.dir() + "/kick_01.wav" => kick1.read;
me.dir() + "/kick_05.wav" => kick5.read;
me.dir() + "/hihat_01.wav" => hihat1.read;
me.dir() + "/snare_01.wav" => snare1.read;
me.dir() + "/stereo_fx_05.wav" => stereoI.read;
me.dir() + "/robot1.wav" => robot1.read;
me.dir() + "/robot2.wav" => robot2.read;

// set all playheads to end so no sound is made
kick1.samples() => kick1.pos;
kick5.samples() => kick5.pos;
hihat1.samples() => hihat1.pos;
snare1.samples() => snare1.pos;
stereoI.samples() => stereoI.pos;
robot1.samples() => robot1.pos;
robot2.samples() => robot2.pos;

// Initialize and assign intro variables
int lowD;
int lowEFlat;
int e;
int lowAFlat;
int bflat;
int b;
int aflat;
int a;
int dflat;
int g;
int gflat;
int eflat;
int f;
int c;
int d;
50 => lowD;
51 => lowEFlat;
52 => e;
54 => gflat;
55 => g;
56 => lowAFlat;
57 => a;
58 => bflat;
59 => b;
60 => c;
62 => d;
68 => aflat;
61 => dflat;
63 => eflat;
65 => f;

// INTRO
for (0 => int verse; verse < 1; verse++){
    for (0 => int beatCounter; beatCounter < 8; beatCounter++)
    {
        
        beatCounter % 56 => int voice;
        
        // begin beat
        if ((beatCounter % 8) == 0)
        {
            0 => stereoI.pos;
        }  
        
        250::ms => now;  
    }
    for (0 => int beatCounter; beatCounter < 8; beatCounter++)
    {
        
        beatCounter % 56 => int voice;
        
        // begin beat
        if (((beatCounter % 8) == 0) || ((beatCounter % 8) == 3) || ((beatCounter % 8) == 7))
        {
            0 => kick5.pos;
        }  
        
        250::ms => now;  
    }
    
    for (0 => int beatCounter; beatCounter < 16; beatCounter++)
    {
        
        beatCounter % 56 => int voice;
        
        // begin beat
        if (((beatCounter % 8) == 0))
        {
            0 => kick1.pos;
        } 
        if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
        {
            0 => hihat1.pos;
        } 
        if ((beatCounter % 8) == 4)
        {
            0 => snare1.pos;
        } // end beat
                
        250::ms => now;  
    }
} // END INTRO

// VERSE 1
for (0 => int verse; verse < 2; verse++){
for (0 => int beatCounter; beatCounter < 56; beatCounter++)
{
    0.9 => s.gain;
    
    beatCounter % 56 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    } // end beat
    
    // voice
    if ((voice == 28) || (voice == 29) || (voice == 30) || (voice == 31) || (voice == 32) || (voice == 33) || (voice == 34) || (voice == 35) || (voice == 48) || (voice == 49) || (voice == 56))
    {
        0 => s.gain;
    }
    
    if ((voice == 0) || (voice == 4) || (voice == 26) || (voice == 36) || (voice == 46) || (voice == 50) || (voice == 54))
    {
        Std.mtof(e) => s.freq;
        0.9 => s.gain;
    }
    
    if ((voice == 2) || (voice == 38) || (voice == 52))
    {
        Std.mtof(lowEFlat) => s.freq;
    }
    
    if ((voice == 6) || (voice == 24) || (voice == 40) || (voice == 44))
    {
        Std.mtof(g) => s.freq;
    }
    
    if ((voice == 8) || (voice == 22) || (voice == 42))
    {
        Std.mtof(a) => s.freq;
    }
    
    if ((voice == 10) || (voice == 18))
    {
        Std.mtof(b) => s.freq;
    }
    
    if ((voice == 12) || (voice == 16))
    {
        Std.mtof(c) => s.freq;
    }
    
    if ((voice == 14))
    {
        Std.mtof(d) => s.freq;
    }
    //end voice
 
    250::ms => now;  
}
} // END VERSE 1

// DRUM INTERLUDE 2 CYCLES
for (0 => int beatCounter; beatCounter < 16; beatCounter++)
{
    0 => s.gain;
    
    beatCounter % 56 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    }// end beat
    
    250::ms => now;
} // END DRUM INTERLUDE 2 CYCLES

// CHORUS LOOP 1

for (0 => int beatCounter; beatCounter < 92; beatCounter++)
{
    0.9 => s.gain;
    
    beatCounter % 92 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    } // end beat
    
    // start voice
    if ((voice == 40) || (voice == 41) || (voice == 55) || (voice == 66) || (voice == 77))
    {
        0 => s.gain;
    }
    
    if ((voice == 0) || (voice == 2))
    {
        Std.mtof(e) => s.freq;
        0.9 => s.gain;
    }
    
    if (voice == 1)
    {
        Std.mtof(lowEFlat) => s.freq;
    }
    
    if ((voice == 3) || (voice == 21) || (voice == 57) || (voice == 61) || (voice == 67))
    {
        Std.mtof(g) => s.freq;
    }
    
    if ((voice == 73) || (voice == 78))
    {
        Std.mtof(lowAFlat) => s.freq;
    }
    
    if ((voice == 4) || (voice == 14) || (voice == 27) || (voice == 31) || (voice == 45) || (voice == 56) || (voice == 58) || (voice == 68) || (voice == 79) || (voice == 85))
    {
        Std.mtof(a) => s.freq;
    }
    
    if ((voice == 18) || (voice == 15) || (voice == 19) || (voice == 26) || (voice == 30) || (voice == 32) || (voice == 42) || (voice == 44) || (voice == 59) || (voice == 69) || (voice == 80) || (voice == 84))
    {
        Std.mtof(b) => s.freq;
        0.9 => s.gain;
    }
    
    if ((voice == 6) || (voice == 16) || (voice == 18) || (voice == 43) || (voice == 83))
    {
        Std.mtof(c) => s.freq;
    }
    
    if ((voice == 17) || (voice == 28))
    {
        Std.mtof(d) => s.freq;
    } // end voice
    
    250::ms => now;  
} // END CHORUS 1 LOOP

// DRUM INTERLUDE 1 CYCLE
for (0 => int beatCounter; beatCounter < 8; beatCounter++)
{
    0 => s.gain;
    
    beatCounter % 56 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    } // end beat
    
    250::ms => now;
} 

// VERSE 2
for (0 => int verse; verse < 2; verse++){
    for (0 => int beatCounter; beatCounter < 56; beatCounter++)
    {
        0.9 => s.gain;
        
        beatCounter % 56 => int voice;
        
        // begin beat
        if (((beatCounter % 8) == 0))
        {
            0 => kick1.pos;
        } 
        if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
        {
            0 => hihat1.pos;
        } 
        if ((beatCounter % 8) == 4)
        {
            0 => snare1.pos;
        } // end beat
        
        // voice
        if ((voice == 28) || (voice == 29) || (voice == 30) || (voice == 31) || (voice == 32) || (voice == 33) || (voice == 34) || (voice == 35) || (voice == 48) || (voice == 49) || (voice == 56))
        {
            0 => s.gain;
        }
        
        if ((voice == 0) || (voice == 4) || (voice == 26) || (voice == 36) || (voice == 46) || (voice == 50) || (voice == 54))
        {
            Std.mtof(e) => s.freq;
            0.9 => s.gain;
        }
        
        if ((voice == 2) || (voice == 38) || (voice == 52))
        {
            Std.mtof(lowEFlat) => s.freq;
        }
        
        if ((voice == 6) || (voice == 24) || (voice == 40) || (voice == 44))
        {
            Std.mtof(g) => s.freq;
        }
        
        if ((voice == 8) || (voice == 22) || (voice == 42))
        {
            Std.mtof(a) => s.freq;
        }
        
        if ((voice == 10) || (voice == 18))
        {
            Std.mtof(b) => s.freq;
        }
        
        if ((voice == 12) || (voice == 16))
        {
            Std.mtof(c) => s.freq;
        }
        
        if ((voice == 14))
        {
            Std.mtof(d) => s.freq;
        }
        //end voice
        
        250::ms => now;  
    }
} // END VERSE 2

// DRUM INTERLUDE 1 CYCLE
for (0 => int beatCounter; beatCounter < 8; beatCounter++)
{
    0 => s.gain;
    
    beatCounter % 56 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    } // end beat
    
    250::ms => now;
}

// CHORUS LOOP 2

for (0 => int beatCounter; beatCounter < 92; beatCounter++)
{
    0.9 => s.gain;
    
    beatCounter % 92 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    } // end beat
    
    // start voice
    if ((voice == 40) || (voice == 41) || (voice == 55) || (voice == 66) || (voice == 77))
    {
        0 => s.gain;
    }
    
    if ((voice == 0) || (voice == 2))
    {
        Std.mtof(e) => s.freq;
        0.9 => s.gain;
    }
    
    if (voice == 1)
    {
        Std.mtof(lowEFlat) => s.freq;
    }
    
    if ((voice == 3) || (voice == 21) || (voice == 57) || (voice == 61) || (voice == 67))
    {
        Std.mtof(g) => s.freq;
    }
    
    if ((voice == 73) || (voice == 78))
    {
        Std.mtof(lowAFlat) => s.freq;
    }
    
    if ((voice == 4) || (voice == 14) || (voice == 27) || (voice == 31) || (voice == 45) || (voice == 56) || (voice == 58) || (voice == 68) || (voice == 79) || (voice == 85))
    {
        Std.mtof(a) => s.freq;
    }
    
    if ((voice == 18) || (voice == 15) || (voice == 19) || (voice == 26) || (voice == 30) || (voice == 32) || (voice == 42) || (voice == 44) || (voice == 59) || (voice == 69) || (voice == 80) || (voice == 84))
    {
        Std.mtof(b) => s.freq;
        0.9 => s.gain;
    }
    
    if ((voice == 6) || (voice == 16) || (voice == 18) || (voice == 43) || (voice == 83))
    {
        Std.mtof(c) => s.freq;
    }
    
    if ((voice == 17) || (voice == 28))
    {
        Std.mtof(d) => s.freq;
    } // end voice
    
    250::ms => now;  
} // END CHORUS 2 LOOP

// INTO THE VOLCANO LOOP

for (0 => int beatCounter; beatCounter < 108; beatCounter++)
{
    0.9 => s.gain;
    
    beatCounter % 108 => int voice;
    
    // begin beat
    if (((beatCounter % 8) == 0))
    {
        0 => kick1.pos;
    } 
    if (((beatCounter % 8) == 2) || ((beatCounter % 8) == 6))
    {
        0 => hihat1.pos;
    } 
    if ((beatCounter % 8) == 4)
    {
        0 => snare1.pos;
    } // end beat
    
    // start voice
    
    if ((voice == 80) || (voice == 81))
    {
        0 => s.gain;
    }
    
    if ((voice == 52) || (voice == 66) || (voice == 106))
    {
        Std.mtof(lowD) => s.freq;
    }
    
    if ((voice == 50) || (voice == 54) || (voice == 64) || (voice == 68) || (voice == 104))
    {
        Std.mtof(e) => s.freq;
    }
    
    if ((voice == 22) || (voice == 32) || (voice == 34) || (voice == 44) || (voice == 56) || (voice == 70) || (voice == 82) || (voice == 90) || (voice == 100))
    {
        Std.mtof(g) => s.freq;
    }
    
    if ((voice == 8) || (voice == 24) || (voice == 36) || (voice == 84) || (voice == 88) || (voice == 92) || (voice == 98))
    {
        Std.mtof(a) => s.freq;
    }
    
    if ((voice == 0) || (voice == 2) || (voice == 4) || (voice == 10) || (voice == 18) || (voice == 26) || (voice == 38) || (voice == 86) || (voice == 96))
    {
        Std.mtof(b) => s.freq;
        0.9 => s.gain;
    }
    if ((voice == 12) || (voice == 16))
    {
        Std.mtof(c) => s.freq;
    }
    if (voice == 14)
    {
        Std.mtof(d) => s.freq;
    }
    
    250::ms => now;  
} // END VOLCANO

// INTERVIEW WITH A ROBOT
for (0 => int foo; foo < 1; foo++)
{
    0 => s.gain;
    
    0 => robot1.pos; 
    10::second => now;  
    
    0 => robot2.pos; 
    19::second => now;
}