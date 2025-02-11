% Define a function to create a sine wave for a given frequency and duration
% frq: the index of the note (based on its position in the notename array)
% dur: the duration of the note in samples
notecreate = @(frq, dur) sin(2 * pi * [1:dur] / 8192 * (440 * 2.^((frq - 1) / 12)));

% Define the names of the musical notes
% The notes are in standard Western tuning, from A to G# (12 notes)
notename = {'A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'};

% Define the song as a sequence of note names
% Each note is represented by its name (e.g., 'A', 'A#', etc.)
% The song contains a repeating pattern of 'E', 'C#', and 'G' notes
song = {'E', 'E', 'C#', 'E', 'E', 'C#', 'E', 'C#', 'E', 'E', 'C#', 'E', 'E', 'C#', 'E', 'C#', 'G#', 'G#', 'E', 'G#', 'G#', 'E', 'G#', 'E','G#', 'G#', 'E', 'G#', 'G#', 'E', 'G#', 'E','F#','F#','D#','F#','F#','D#','F#','D#','F#','F#','D#','F#','F#','D#','F#','D#',};

% Initialize an empty array to store the indices of the notes in the song
songidx = [];

% Loop through each note in the song to convert the note name to its index
for k1 = 1:length(song)
    % Use strcmp to compare the current note name with the names in the notename array
    idx = strcmp(song(k1), notename);
    % Find the index of the note in the notename array and store it in songidx
    songidx(k1) = find(idx);
end    

% Define the duration of each note in samples (0.1 seconds * 8192 samples per second)
% This will determine how long each note will be played in the audio file
dur = 0.1 * 8192;

% Initialize an empty array to hold the entire audio for the song
songnote = [];

% Loop through each note in the song and generate the audio for it
for k1 = 1:length(songidx)
    % Generate the sine wave for the current note using the notecreate function
    % The sine wave is generated based on the note index (songidx(k1)) and duration (dur)
    % The result is a row vector representing the note
    % We append some silence (zeros) after the note for separation between notes
    songnote = [songnote; [notecreate(songidx(k1), dur), zeros(1, 75)]']; 
    % The zeros(1,75) adds 75 samples of silence after each note
    % Adjust the number '75' if you want more or less silence between notes
end

% Use audiowrite to save the generated song as a .wav file
% 'test6.wav' is the output file name, songnote contains the generated audio data, and 8192 is the sample rate
audiowrite('test8.wav', songnote, 8192);
