function number=dtmfdecoding(x)
% x: signal (vector) containing the corresponding tones.
% number: number ranging from 0 to 11


number=-1; % if output=-1, there is bug in your code
fs=8000;
L=64;
freqTable = [941,697,697,697,770,770,770,852,852,852,941,941; 
    1336,1209,1336,1477,1209,1336,1477,1209,1336,1477,1209,1477];

durTone = 0.5;

freqPresent = zeros(size(freqTable));
[n, m] = size(freqTable);

for n = 1:n
	for m = 1:m
		freqPresent(n,m) = norm(conv(bandpassFilter(L, freqTable(n,m), fs), x),2);
	end
end

freqPresent(1,:) = freqPresent(1,:) == max (freqPresent(1,:));
freqPresent(2,:) = freqPresent(2,:) == max (freqPresent(2,:));

[C,I] = max (freqPresent (1,:).*freqPresent(2,:));
number = I-1;