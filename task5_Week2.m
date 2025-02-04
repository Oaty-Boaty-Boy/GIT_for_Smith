% Given values
piano_middle_C.wav = 'piano_middle_C.wav';
% First read wav file into memory
[Sig, Fs]=audioread(piano_middle_C.wav);



Fs = 44100; % Sampling frequency
Leng = length(Sig); % Length of the audio signal
bit_depth = 16; % Bit depth (assuming 16-bit audio)
num_channels = 1; % Number of channels (mono)

% Calculate expected file size in bytes
expected_file_size = Leng * (bit_depth / 8) * num_channels;

% Convert to kilobytes for easier reading
expected_file_size_KB = expected_file_size / 1024;

disp(['Expected File Size: ', num2str(expected_file_size_KB), ' KB']);