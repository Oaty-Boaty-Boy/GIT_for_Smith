% Create a zero array for impulse response
ir = zeros(1, 50000); % Create an array (vector) of 50,000 zeros. This will be used to store the impulse response.

% Set the first element of the impulse response to 1
ir([1]) = [1]; % Set the first value of the 'ir' array to 1. This represents a unit impulse (a spike at the beginning).

% Read an audio file ('pluck.wav') and store its signal and sampling rate
[sig, fs] = audioread('pluck.wav'); % 'audioread' reads the audio file 'pluck.wav' and stores the audio data in 'sig'.
% 'fs' is the sampling frequency (rate) of the audio file, which tells how many samples per second were recorded.

% Play the original audio sound
%sound(sig, fs); % The 'sound' function plays the original signal ('sig') at the given sample rate ('fs').

% Convolve the original signal with the impulse response
y = conv(sig, ir); % 'conv' performs a convolution between the audio signal 'sig' and the impulse response 'ir'.
% Convolution is used to simulate the effect of filtering or altering the original signal.

% Create two subplots to compare the original signal and the convolved signal
subplot(211), plot(sig); % 'subplot(211)' creates a plot in the upper part of the figure (top half), 
% and 'plot(sig)' displays the original audio signal.
subplot(212), plot(y); % 'subplot(212)' creates a plot in the lower part of the figure (bottom half),
% and 'plot(y)' displays the convolved signal.

% Play the convolved signal as sound
sound(y, fs); % 'sound(y, fs)' plays the convolved signal 'y' at the same sampling rate ('fs') as the original signal.
