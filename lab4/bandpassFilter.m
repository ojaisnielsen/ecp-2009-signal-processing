function h=bandpassFilter(L,fb,fs)
	n = 0:1:L-1;
	h = (2/L)*cos(2*pi*fb*n/fs);