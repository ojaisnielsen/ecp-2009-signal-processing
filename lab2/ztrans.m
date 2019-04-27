function Z = ztrans(x, z)
	Z = polyval(x(end:-1:1), 1./z);
