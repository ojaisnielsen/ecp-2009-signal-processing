function [MAX,i,j] = max_mat(m)
	[M, N] = size(m);
	[MAX, I] = max(reshape(m, numel(m), 1));
	i = mod(I - 1, M) + 1;
	j = floor((I - 1)/M) + 1;