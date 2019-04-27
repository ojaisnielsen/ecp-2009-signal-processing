function [i,j,correl]=measure(patch_ref,img, search_rad, i0, j0)
	res = zeros(2*search_rad +1,2*search_rad +1);
	[M,N] = size(img);
	[m,n] = size(patch_ref);
	patch_m = floor(m/2);
	patch_n = floor(n/2);
	
	for i = (-search_rad:search_rad)
		for j = (-search_rad:search_rad)
			if (i0 + i - patch_m) > 0 && (i0 + i + patch_m) <= M && (j0 + j - patch_n) > 0 && (j0 + j + patch_n) <= N
				patch = img(i0 + i - patch_m:i0 + i + patch_m, j0 + j - patch_n:j0 + j + patch_n);
				res(search_rad + 1 + i,search_rad + 1 + j) = cross_correl(patch_ref, patch);
			else
				res(search_rad + 1 + i,search_rad + 1 + j) = 0;
			end
		end
	end
	[correl, i, j] = max_mat(res);
	i = i0 + i - search_rad -1;
	j = j0 + j - search_rad -1;
