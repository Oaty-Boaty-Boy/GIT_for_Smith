% Generate a sine wave
fs = 44100;  % Sampling frequency (44.1kHz for audio-like quality)
f = 440;     % Frequency of the sine wave (A4 note, 440Hz)
t = 0:1/fs:1; % Time vector for 1 second
x = sin(2 * pi * f * t);  % Sine wave signal

y = x;  % Initialize y as a copy of the sine wave signal

% Apply hard clipping distortion to the negative part of the sine wave
for i = 1:length(x)
    if (x(i) < -0.1)
        y(i) = -0.1;  % Clip negative values below -0.1
    end
    % Positive part is left unchanged
end

% Plot both original and clipped sine waves for comparison
figure;

% Choose a small section of the signal for clarity (e.g., first 500 samples)
segment = 1:500;

% Plot the original sine wave (dashed line)
plot(segment, x(segment), '--'); 
hold on;

% Plot the clipped sine wave (solid red line)
plot(segment, y(segment), 'r'); 

% Set axis limits and title
axis([0 500 -1 1]);  % Limit the plot to the segment
title('Transfer Function for Hard Clipping on Negative Parts of Sine Wave');
legend('Original Sine Wave', 'Clipped Sine Wave');
grid on;
hold off;

% Play the original sine wave and clipped sine wave
sound(x, fs);
pause(1.5);  % Wait for the original sound to finish
sound(y, fs);  % Play the clipped sine wave

