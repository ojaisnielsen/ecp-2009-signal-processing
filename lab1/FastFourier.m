function X=FastFourier(x)
	N=length(x);
	if N==1
		X=x;
	else
		W=exp(-2*pi*i/N);
		xOdd=x(1:2:end);
		xEven=x(2:2:end);
		T0=FastFourier(xOdd);
		T1=FastFourier(xEven);
		k=0:(N/2)-1;
		Wk=W.^k';
		WkT1=Wk.*T1;
		X1=T0+WkT1;
		X2=T0-WkT1;
		X=[X1;X2];
	end
endfunction