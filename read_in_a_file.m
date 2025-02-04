%audio filename must in same directory of this m file
piano_middle_C.wav = 'piano_middle_C.wav';
% First read wav file into memory
[Sig, Fs]=audioread(piano_middle_C.wav);
%Sig stores raw audio data in column;
%Fs sampling frequency