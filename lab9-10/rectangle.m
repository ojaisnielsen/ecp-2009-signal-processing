function im=rectangle(im_init, i, j, m, n)

	im = im_init;
	[M,N] = size(im);

	i_min = min([max([i - m; 0]);M]);
	i_max = max([min([i + m; M]);i_min]);
	j_min = min([max([j - n; 0]),N]);
	j_max = max([min([j + n; N]),j_min]);
	
	lm = i_max - i_min + 1;
	ln = j_max - j_min + 1;
	
	im(i_min:i_max,j_min) = 255 * ones(lm, 1);
	im(i_min:i_max,j_max) = 255 * ones(lm, 1);
	im(i_min,j_min:j_max) = 255 * ones(1, ln);
	im(i_max,j_min:j_max) = 255 * ones(1, ln);

	
	
	
	