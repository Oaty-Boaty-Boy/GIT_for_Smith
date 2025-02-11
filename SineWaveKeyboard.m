function SineWaveKeyboard(amp, freq, dur, theta)
    Fs = 11025;             % Sample rate (Hz)
    Ts = 1/Fs;             % Sample interval
    t = 0:Ts:dur;          % Time vector from 0 to dur with step size Ts
    W = freq*2*pi;
    theta_radians = theta / 180 * pi;  % Phase offset in radians

    sig = amp * sin(W * t + theta_radians);  % Generate the sine wave

    % Plotting the sine wave
    plot(t, sig);
    %plot (Fs/freq) gives one sample
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    title(['Sine Wave Signal Hz']);
    grid on;

    %write file
    audiowrite('A4.wav',sig, Fs);
end

