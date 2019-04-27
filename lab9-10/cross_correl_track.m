function []=cross_correl_track()
	data = load('dataset.mat');
	img = data.img;
	i0 = 62;
	j0 = 146;
	patch_m = 15;
	patch_n = 10;
	search_rad = 10;
	[M,N,K] = size(img);
	patch_ref = img(i0 - patch_m:i0 + patch_m, j0- patch_n:j0+ patch_n);
	
	img(:,:,1) = rectangle(img(:,:,1), i0, j0, patch_m, patch_n);
	
	for im = (2:K)
		
		[i0,j0,correl] = measure(patch_ref, img(:,:,im), search_rad, i0, j0);
		img(:,:,im) = rectangle(img(:,:,im), i0, j0, patch_m, patch_n);

	end
	save('dataset_tracked_correl.mat', 'img');