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

% Compute the magnitude and phase spectrum of the DFT
Xmag = abs(X); % magnitude of the DFT
Xphase = angle(X); % phase of the DFT




%% Discarding negative frequencies
% To create a more readable spectrum plot we need to discard the negative 
% frequencies by only keeping the first floor(N/2 + 1) coefficients.
% We do this for both our coefficients and the frequency values.
spec_length = floor(N/2 + 1);
spec = dft(1:spec_length);
spec_mag = abs(spec);
spec_freqs = freqs(1:spec_length);

% Plotting only the positive frequency coefficient magnitudes. The 
% magnitude of our spectrum is looking very high. That's because it
% hasn't been normalised yet.
figure(2);
plot(spec_freqs, spec_mag);
title('Positive Half of the Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


% Frequency axis for plotting
f = (0:N-1) * (fs / N); % frequency values for plotting




% Plot the magnitude spectrum
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
