function []=kalman_track()
	data = load('dataset.mat');
	img = data.img;
	[M,N,K] = size(img);
	patch_m = 15;
	patch_n = 10;
	search_rad = 10;
	A = [[1,0,1,0];[0,1,0,1];[0,0,1,0];[0,0,0,1]];
	H = [[1,0,0,0];[0,1,0,0]];
	Q = [[5,0,0,0];[0,5,0,0];[0,0,1,0];[0,0,0,1]];
	px = 146;
	py = 62;
	u = 0;
	v = 0;
	x_post = [px; py; u; v];
	z = [px; py];
	P_post = zeros(4,4);
	patch_ref = img(py - patch_m:py + patch_m, px- patch_n:px+ patch_n);
	
	i0 = round(x_post(2));
	j0 = round(x_post(1));
	
	img(:,:,1) = rectangle(img(:,:,1), i0, j0, patch_m, patch_n);
	
	for im = (2:K)
	
		x_pri = A*x_post;
		P_pri = A*P_post*A' + Q;
		[i,j,correl] = measure(patch_ref,img(:,:,im), search_rad, i0, j0);
		z = [j; i];
		if (correl > 1/2)
			R = 50*eye(2,2);
		else
			R = 10000*eye(2,2);
		end
		K = P_pri*H'*inv(H*P_pri*H' + R);
		x_post = x_pri + K*(z - H*x_pri);
		P_post = (eye(4,4)-K*H)*P_pri;
		
		i0 = round(x_post(2));
		j0 = round(x_post(1));
		img(:,:,im) = rectangle(img(:,:,im), i0, j0, patch_m, patch_n);

	end
	
	
	save('dataset_tracked_kalman.mat', 'img');