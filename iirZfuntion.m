% Example parameters for the Biquad filter design
Fs = 44100;                % Sampling frequency (Hz)
f0 = 1000;                 % Center frequency (Hz) for a low-pass filter
Q = 1 / sqrt(2);           % Quality factor (Q)
gain = 1;                  % Gain at the center frequency (linear scale, not in dB)

% Step 1: Compute the normalized frequency
w0 = 2 * pi * f0 / Fs;     % Normalized frequency (rad/sample)

% Step 2: Calculate the filter coefficients using the CookBook formulas
alpha = sin(w0) / (2 * Q); % Alpha factor for the filter

b0 = (1 - cos(w0)) / 2;    % Numerator coefficients (feedforward)
b1 = 1 - cos(w0);
b2 = (1 - cos(w0)) / 2;
a0 = 1 + alpha;            % Denominator coefficients (feedback)
a1 = -2 * cos(w0);
a2 = 1 - alpha;

% Step 3: Normalize the coefficients (divide by a0 to ensure the filter is normalized)
b = [b0, b1, b2] / a0;
a = [1, a1, a2] / a0;

% Step 4: Create an example input signal (e.g., a sinusoidal signal)
t = 0:1/Fs:1;                % Time vector (1 second)
X = sin(2 * pi * 500 * t);   % Example input signal (500 Hz sinusoidal wave)

% Step 5: Apply the IIR filter to the signal using the filter function
Y = filter(b, a, X);         % Filtered signal

% Step 6: Plot the input and output signals
figure;
subplot(2, 1, 1);
plot(t, X);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, Y);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');

