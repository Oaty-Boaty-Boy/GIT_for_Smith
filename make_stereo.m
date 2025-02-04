[mono, Fs] = audioread('Piano_middle_C.wav');
stereo = [mono,mono];
audiowrite('piano_middle_C_stereo.wav', stereo, Fs);


