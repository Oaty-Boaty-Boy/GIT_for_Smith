function sig = SineWave(amp,freq,Fs,dur,theta)

Ts = 1/FS: % sample interval
t+ 0:Ts:dur;

theta_radians = Theta/180*pi; % phase offste in radians 

sig = amp * sin(2 * pi *freq .*t + theta_radians);
plot (t, sig)% plot wave 
xlabel('time in seconds')
ylabel('amplitude')
grid on 

end 

