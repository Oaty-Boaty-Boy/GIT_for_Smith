dur = 2;      % Duration in seconds
freq = 1;     % Frequency (Hz)
theta = 90;   % Phase offset (degrees)
amp = 1;      % Amplitude
clipPos = 0.1;  % Clipping threshold for positive values
clipNeg = -0.1;  % Clipping threshold for negative values

% Call the function to generate and plot the sine wave
SineWave(amp, freq, dur, theta);