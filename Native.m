% Step 1: Read the audio file using the 'native' argument

info = audioinfo ('piano_middle_C.wav')

[signal_native, Fs_native] = audioread('piano_middle_C.wav', 'native'); 

Duration = length(signal_native) / Fs; 
Time = 0:Ts:Duration-Ts;

maximum= max(abs(signal_native));
scaler = 1/maximum;
for i=info.TotalSamples
    Norm(i)= signal_native(i)*scaler
end 



% Step 3: Plot the signal in the time domain
figure;
plot(Time, Norm);
title('Mono Audio Signal (Native Format) - Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
