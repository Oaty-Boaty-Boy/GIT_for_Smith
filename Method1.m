% Define time range
t1 = 0.5; % Start time in seconds
t2 = 1;   % End time in seconds

% Load the audio file and extract the required portion directly using audioread
Fs = 44100; % Sampling frequency (assuming 44.1 kHz)
start_sample = round(t1 * Fs);  % Start sample index
end_sample = round(t2 * Fs);    % End sample index

% Use audioread to read the portion of the signal between t1 and t2
[sig2, Fs] = audioread('Piano_middle_C.wav', [start_sample, end_sample]);

% Display the result

time = t1:Ts:t2;

% Display the result
figure;
plot(time, sig2);                   % Plot signal vs. time
ylabel('Amplitude');               % Label y-axis
xlabel('Time (Sec)');              % Label x-axis
title('Audio Signal Over Time');   % Add title to the plot
grid on;   