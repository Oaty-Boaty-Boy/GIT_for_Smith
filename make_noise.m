fs= 44100

noise = randn (1,fs * noisedur);
noisedur = 2;

%sound (noise,fs)
plot (noise)
a=1;
b=Hd.Numerator;
%Yoink=filter(Hd,noise);
%sound (Yoink,fs);




a=1;
newnoise1 = conv(noise, b);
newnoise2 = filter(Hd,noise);

%sound (newnoise1,fs)

sound (newnoise2,fs)


lenA = length(newnoise2);
lenB = length(newnoise1);

difference = abs(lenA-lenB);
disp(['Difference in lengths: ', num2str(difference)]);

signalAnalyzer