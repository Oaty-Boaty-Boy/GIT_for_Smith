fs = 44100;
noise_dur = 1;
samples= fs* noise_dur;


noise = randn (samples,1);


IR= Hd.Numerator;

output= myconv(noise,IR);

sound (output,fs)

