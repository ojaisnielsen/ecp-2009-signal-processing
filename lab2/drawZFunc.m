function []=drawZFunc(pointf)
	tx = -10:10;
	ty = -10:9;
	
	m=numel(tx);
	n=numel(ty);
	
	[X, Y] = meshgrid(tx,ty);
	
	Z = X+i*Y;
	
	
	for k = 1:n
		for l =1:m
			tz(k,l)= feval(pointf, Z(k,l));
		end
	end
			
	mesh(tx,ty,tz);