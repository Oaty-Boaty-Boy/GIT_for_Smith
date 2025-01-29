function SineWave(amp, freq, Fs, dur, theta)
    Ts = 1/Fs;             % Sample interval
    t = 0:Ts:dur;          % Time vector from 0 to dur with step size Ts

    theta_radians = theta / 180 * pi;  % Phase offset in radians

    sig = amp * sin(2 * pi * freq * t + theta_radians);  % Generate the sine wave

    % Plotting the sine wave
    plot(t, sig);
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    title(['Sine Wave Signal Hz']);
    grid on;
end


