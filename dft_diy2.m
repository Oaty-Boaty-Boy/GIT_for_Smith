%% Generate Signal to Analyze
fs = 44100; % sampling frequency
A = 1; % amplitude
freq = 10000; % frequency
phase = 1; % phase in radians
dur = 0.1; % duration in seconds

ts = 1/fs; % calculate the sampling period
t = 0:ts:(dur - ts); % generate sample times
sig = A * cos(2*pi*freq*t + phase); % generate sinusoidal signal

% Compute the DFT using the direct formula
N = length(sig);  % length of the signal
X = zeros(1, N);  % initialize the DFT result array

for k = 1:N
    for n = 1:N
        X(k) = X(k) + sig(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
    end
end

% Normalize the DFT result to prevent high magnitude
X = X / N;

% Compute the magnitude and phase spectrum of the DFT
Xmag = abs(X); % magnitude of the DFT
Xphase = angle(X); % phase of the DFT

%% Discarding negative frequencies
% We only need the first floor(N/2 + 1) coefficients for the positive
% frequencies.
spec_length = floor(N/2) + 1;  % Only the positive half of the spectrum

% Extract only the positive frequencies and corresponding coefficients
spec = X(1:spec_length);
spec_mag = abs(spec);
spec_freqs = (0:spec_length-1) * (fs / N);  % Frequencies for the positive spectrum

% Plotting only the positive frequency coefficient magnitudes
figure;
plot(spec_freqs, spec_mag);
title('Positive Half of the Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%% Frequency axis for the full spectrum
f = (0:N-1) * (fs / N); % frequency values for plotting the entire spectrum

% Plot the full magnitude spectrum
figure;
subplot(2,1,1);
plot(f, Xmag);
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot the phase spectrum
subplot(2,1,2);
plot(f, Xphase);
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
