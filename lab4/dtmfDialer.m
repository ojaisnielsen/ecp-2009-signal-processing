function x = dtmfDialer(number)
%dtmfDialer: Create a signal which will dial a DTMF (Touch Tone)
%telephone system.

% usage: x = dtmfDialer(number)
% number: number ranging from 0 to 11
% x: signal (vector) containing the corresponding tones.
if number<0||number>11
    error('The input number is not allowed!')
end

fs = 8000;

freqTable = [941,697,697,697,770,770,770,852,852,852,941,941;
            1336,1209,1336,1477,1209,1336,1477,1209,1336,1477,1209,1477];
        
durTone = 0.5;

samp = 0:1/fs:durTone;
x = 0.5*cos(2*pi*freqTable(1,number+1)*samp)+0.5*cos(2*pi*freqTable(2,number+1)*samp);