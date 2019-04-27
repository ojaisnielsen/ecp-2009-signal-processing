[y, FS, BITS] = wavread ("top.wav");
N=length(y);

Y=fft(y);
k=1:N;
YInv=Y(end:-1:1);
yInv=ifft(YInv);

wavwrite(yInv, FS, BITS, "pot.wav");