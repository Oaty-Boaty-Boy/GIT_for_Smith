[sig_pluck,Fs]= audioread ("pluck.wav");
[Ir,FsIr]= audioread ("Church.wav");

[Ir2]=resample(Ir,Fs,FsIr);

y=conv(sig_pluck,Ir2(:,1));
y=y./max(abs(y));

%sound(y,Fs);
plot(y);

blended = wet_dry_function (sig_pluck,y,50,Fs)
