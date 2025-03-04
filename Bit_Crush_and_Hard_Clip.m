% Main script to call the function
fs = 44100;  % Sampling frequency (44.1kHz for audio-like quality)
f = 440;     % Frequency of the sine wave (A4 note, 440Hz)
dur = 1;     % Duration of the sine wave (1 second)
clipPos = 0.7;  % Clipping threshold for positive values
clipNeg = -0.7;  % Clipping threshold for negative values
bitDepth = 2;  % Bit depth for bit crushing (lower means more crushing)

% Generate and process the sine wave with clipping and bit crushing
SineWaveWithClippingAndBitCrushing(fs, f, dur, clipPos, clipNeg, bitDepth);

function SineWaveWithClippingAndBitCrushing(fs, f, dur, clipPos, clipNeg, bitDepth)
    % Time vector for the signal
    t = 0:1/fs:dur;                
    
    % Generate the sine wave
    originalSignal = sin(2 * pi * f * t);       

    % Apply clipping distortion
    clippedSignal = originalSignal;  % Initialize clippedSignal as a copy of the original signal
    for i = 1:length(originalSignal)
        if (originalSignal(i) > clipPos)
            clippedSignal(i) = clipPos;  % Clip positive values above the clipPos threshold
        elseif (originalSignal(i) < clipNeg)
            clippedSignal(i) = clipNeg;  % Clip negative values below the clipNeg threshold
        end
    end

    % Apply bit crushing to the clipped signal
    bitCrushedSignal = BitCrush(clippedSignal, bitDepth);

    % Plot the original, clipped, and bit-crushed sine waves for comparison
    figure;

    % Choose a small section of the signal for clarity (e.g., first 500 samples)
    segment = 1:500;

    % Plot the original sine wave (dashed line)
    subplot(3,1,1);
    plot(segment, originalSignal(segment), '--'); 
    title('Original Sine Wave');
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    grid on;
    hold on;

    % Plot the clipped sine wave (solid red line)
    subplot(3,1,2);
    plot(segment, clippedSignal(segment), 'r');
    title(['Clipped Sine Wave (Pos: ', num2str(clipPos), ', Neg: ', num2str(clipNeg), ')']);
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    grid on;
    hold on;

    % Plot the bit-crushed sine wave (solid green line)
    subplot(3,1,3);
    plot(segment, bitCrushedSignal(segment), 'g');
    title(['Bit-Crushed Sine Wave (Bit Depth: ', num2str(bitDepth), ')']);
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    grid on;

    % Play the original sine wave, clipped sine wave, and bit-crushed sine wave
    sound(originalSignal, fs);
    pause(1.5);  % Wait for the original sound to finish
    sound(clippedSignal, fs);  % Play the clipped sine wave
    pause(1.5);  % Wait for the clipped sound to finish
    sound(bitCrushedSignal, fs);  % Play the bit-crushed sine wave
end

% Function to apply bit crushing
function bitCrushedSignal = BitCrush(inputSignal, bitDepth)
    % Calculate the number of levels based on the bit depth
    numLevels = 2^bitDepth;  % 2^bitDepth quantization levels

    % Scale the signal to the range [0, numLevels]
    scaledSignal = inputSignal * (numLevels / 2);  

    % Round the scaled signal to the nearest integer to simulate quantization
    quantizedSignal = round(scaledSignal);

    % Scale back to the original range [-1, 1]
    bitCrushedSignal = quantizedSignal * (2 / numLevels);  
end
