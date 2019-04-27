[y, FS, BITS] = wavread ("paint_ball.wav");
N=length(y);

Y=fft(y);
k=0:N-1;
Coef=(exp(i*2*pi*5100/N)).^k';
YShift=Coef.*Y;
yShift=ifft(YShift);

wavwrite(yShift, FS, BITS, "ball_paint.wav");