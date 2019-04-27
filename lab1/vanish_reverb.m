[y, FS, BITS] = wavread ("paint_ball.wav");
N=length(y);

Y=fft(y);
k=0:N-1;
Coef=(exp(i*2*pi*1000/N)).^k';
Reverb=Y+Coef.*Y;
vanish=((1).-(k'/N)).^2;
Vanish=fft(vanish);

for k=1:N-1
	ReverbVanish(k)=dot(Vanish,[Reverb(k:-1:1);Reverb(end:-1:k+1)]);
end
ReverbVanish(N)=dot(Vanish,Reverb(end:-1:1));
reverbvanish=ifft(ReverbVanish);

wavwrite(reverbvanish, FS, BITS, "vanish2.wav");