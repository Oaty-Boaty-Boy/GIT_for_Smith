[sig_pluck,Fs]= audioread ("pluck.wav");
t=[0.001,0.5,1,1.5,2]

Ir= zeros (Fs*3,1)

Ir(round(Fs*t(1)))=1;
Ir(round(Fs*t(2)))=1;
Ir(round(Fs*t(3)))=1;
Ir(round(Fs*t(4)))=1;
Ir(round(Fs*t(5)))=1;

y = conv(sig, Ir);

sound(y,Fs)

