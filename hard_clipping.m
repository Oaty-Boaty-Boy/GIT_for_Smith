[x, fs] = audioread('Fly.L.wav');  % Read the audio file

y = x;  % Initialize y as a copy of the original signal

% Apply hard clipping distortion
for i = 1:length(x)
    if (x(i) > 0.1)
        y(i) = 0.1;  % Clip positive values above 0.1
    elseif (x(i) < -0.1)
        y(i) = -0.1;  % Clip negative values below -0.1
    end
end

% Play the clipped audio
sound(y, fs);

% Plot both original and clipped signals for comparison
figure;

% Choose a small section of the signal for clarity (e.g., first 500 samples)
segment = 1:500;

% Plot the original signal (dashed line)
plot(segment, x(segment), '--'); 
hold on;

% Plot the clipped signal (solid red line)
plot(segment, y(segment), 'r'); 

% Set axis limits and title
axis([0 500 -1 1]);  % Limit the plot to the segment
title('Transfer Function for Hard Clipping Distortion');
legend('Original Signal', 'Clipped Signal');
grid on;
hold off;

