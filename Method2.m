% Load the full signal
[sig, Fs] = audioread('Piano_middle_C.wav'); % Read entire audio file

% Define time range
t1 = 0.5; % Start time in seconds
t2 = 1;   % End time in seconds

% Convert time to sample indices
start_sample = round(t1 * Fs);  % Start sample index
end_sample = round(t2 * Fs);    % End sample index
% Extract the portion of the signal between t1 and t2
sig2 = sig(start_sample:end_sample);
time = t1:Ts:t2;

% Display the result
figure;
plot(time, sig2);                   % Plot signal vs. time
ylabel('Amplitude');               % Label y-axis
xlabel('Time (Sec)');              % Label x-axis
title('Audio Signal Over Time');   % Add title to the plot
grid on;                           % Add grid for better visualization;
