function X=DiscreteFourier(x)
	N=length(x);
	W=exp(-2*pi*i/N);
	k=0:N-1;
	K=k'*k;
	Wk=W.^K;
	X=Wk*x;
endfunction