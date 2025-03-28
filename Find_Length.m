
[sig,Fs] = audioread('piano_middle_C.wav'); % sig samples from audio with Fs sampling frequency in [Hz].

Leng = length(sig); % sample lenth
seconds = Leng/Fs; % total time span of audio signal
t = linspace(0, seconds, Leng); % calculate time


figure;
plot(t, sig);
title('Audio Signal of Piano Middle C');
xlabel('Time [s]');
ylabel('Amplitude');
grid on;


%or 
Duration = length(Sig) / Fs;      % Calculate duration of the audio in seconds
disp(Duration);                    % Display the duration

Ts = 1 / Fs;                       % Time step between samples
Time = 0:Ts:Duration-Ts;           % Time vector from 0 to Duration, step size Ts

% Plotting the signal against the time vector
figure;
plot(Time, Sig);                   % Plot signal vs. time
ylabel('Amplitude');               % Label y-axis
xlabel('Time (Sec)');              % Label x-axis
title('Audio Signal Over Time');   % Add title to the plot
grid on;                           % Add grid for better visualization




info = audioinfo ('piano_middle_C.wav')
