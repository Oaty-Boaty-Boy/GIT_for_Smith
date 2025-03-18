% Sound parameters
Amplitude = 0.5;       % Amplitude of the sine wave
Frequency = 440;       % Frequency of the first sine wave (in Hz)
W = Frequency * 2 * pi; % Angular frequency for the first sine wave

Frequency2 = 660;      % Frequency of the second sine wave (in Hz)
W2 = Frequency2 * 2 * pi; % Angular frequency for the second sine wave

% Time parameters
Fs = 11025;            % Sampling frequency (in Hz)
Ts = 1 / Fs;           % Sampling period
Time = 0:Ts:2;         % Time vector for 2 seconds

% Create the two sinusoidal signals
signal1 = Amplitude * cos(W * Time);   % First sine wave (440 Hz)
signal2 = Amplitude * cos(W2 * Time);  % Second sine wave (660 Hz)

% Add the two signals
combined_signal = signal1 + signal2;   % Add the two signals together

% Plot the signals
figure;
subplot(3,1,1);
plot(Time, signal1);
title('Signal 1 (440 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(Time, signal2);
title('Signal 2 (660 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(Time, combined_signal);
title('Combined Signal (440 Hz + 660 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
