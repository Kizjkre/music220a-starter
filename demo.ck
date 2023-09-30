// C, G, B, E
[60 - 12, 67 - 12, 71 - 12, 76 - 12] @=> global int C7[];
// F, C, G, D, E
[65 - 24, 60 - 12, 67 - 12, 74 - 12, 76 - 12] @=> global int F9[];
// A, D, G, C, E
[69 - 24, 62 - 12, 67 - 12, 60, 64] @=> global int Dm11A[];
// G, D, G, C, Eb
[67 - 24, 62 - 12, 67 - 12, 60, 63] @=> global int Dm7b9G[];

Rhodey r[6];
NRev rev => LPF f => Gain g;

0.25 => g.gain;
0.1 => rev.mix;
65 - 24 => Std.mtof => f.freq;

for (int i; i < r.cap(); i++) {
    1 => r[i].lfoSpeed;
    0.0 => r[i].lfoDepth;
    r[i].opAM(0,0.4);
    r[i].opAM(2,0.4);
    r[i].opADSR(0, 0.001, 3.50, 0.0, 0.04);
    r[i].opADSR(2, 0.001, 3.00, 0.0, 0.04);
    r[i] => rev;
    g => dac;
}

fun void roll(int chord[]) {
    for (int i; i < chord.cap(); i++) {
        chord[i] => Std.mtof => r[i].freq;
        0.8 => r[i].noteOn;
        100::ms => now;
    }
}

while (true) {
    roll(C7);
    3::second => now;
    roll(F9);
    3::second => now;
    roll(Dm11A);
    3::second => now;
    roll(Dm7b9G);
    3::second => now;
}
