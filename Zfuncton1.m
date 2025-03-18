% Given parameters
fs = 2000;                % Sampling frequency (Hz)
fc = 500;                 % Cutoff frequency (Hz)
N = 61;                   % Number of filter taps (points)
wc = 2*pi*fc/fs;         % Normalized cutoff frequency (rad/sample)

% Generate the truncated sinc function coefficients
n = -(N-1)/2 : (N-1)/2;  % Index for the filter coefficients
h = sinc(2*fc/fs * n);    % sinc function (scaled by cutoff frequency)
h = h .* (hamming(N)');   % Apply Hamming window to reduce side lobes

% Plot the impulse response
figure;
stem(n, h, 'filled');
title('Impulse Response of the FIR Filter');
xlabel('n');
ylabel('h[n]');

% Plot the frequency response using fvtool
fvtool(h, 1,'Fs',fs);   % Use fvtool to analyze the filter

% Create a signal to filter (example: a mixture of sine waves)
t = 0:1/fs:1;                  % Time vector (1 second duration)
f1 = 100;                      % Frequency of the first sine wave (Hz)
f2 = 800;                      % Frequency of the second sine wave (Hz)
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t);  % Input signal

% Apply the FIR filter to the signal
filtered_signal = filter(h, 1, signal);  % Apply the filter

% Plot the original and filtered signals
figure;
subplot(2, 1, 1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, filtered_signal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Optionally, you can listen to the filtered signal (if supported by your system)
% sound(filtered_signal, fs);

