function []=drawZTrans(x)
	handle = @(z) abs(ztrans(x,z));
	drawZFunc (handle);