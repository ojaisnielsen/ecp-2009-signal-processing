dft = @(x)ztrans(x,exp(2*pi*i.*[0:numel(x)-1]/numel(x)));

N=20;
I=1000;

timeFFT = zeros(3,N);
timeDFT = zeros(3,N);
tic
for n = 1:N
	unitSample = [1];
	unitStep = ones(n);
	unitRamp = [0:1:n-1];
	

	t0=toc;
	for k = 1:I
		dft(unitSample);
	end
	t1=toc;
	timeDFT(1,n)=(t1-t0)/I;
	t0=toc;
	for k = 1:I
		dft(unitStep);
	end
	t1=toc;
	timeDFT(2,n)=(t1-t0)/I;
	t0=toc;
	for k = 1:I
		dft(unitRamp);
	end
	t1=toc;
	timeDFT(3,n)=(t1-t0)/I;
	
	t0=toc;
	for k = 1:I
		fft(unitSample);
	end
	t1=toc;
	timeFFT(1,n)=(t1-t0)/I;
	t0=toc;
	for k = 1:I
		fft(unitStep);
	end
	t1=toc;
	timeFFT(2,n)=(t1-t0)/I;
	t0=toc;
	for k = 1:I
		fft(unitRamp);
	end
	t1=toc;
	timeFFT(3,n)=(t1-t0)/I;
end

x=1:N;
% plot(x,timeDFT(1,x),x,timeFFT(1,x));
% xlabel('Length of the signals');
% ylabel('Average time');
% title(sprintf('Time to compute the dft of a unit sample signal (average on %i iterations)', I));
% legend('Using ztrans','Using fft');

% plot(x,timeDFT(2,x),x,timeFFT(2,x));
% xlabel('Length of the signals');
% ylabel('Average time');
% title(sprintf('Time to compute the dft of a unit step signal (average on %i iterations)', I));
% legend('Using ztrans','Using fft');

plot(x,timeDFT(3,x),x,timeFFT(3,x));
xlabel('Length of the signals');
ylabel('Average time');
title(sprintf('Time to compute the dft of a unit ramp signal (average on %i iterations)', I));
legend('Using ztrans','Using fft');