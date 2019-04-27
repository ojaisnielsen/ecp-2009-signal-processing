function p=cross_correl(u,v)
	u = reshape(u,1,numel(u));
	v = reshape(v,numel(v),1);
	u = u - mean(u);
	v = v - mean(v);
	p = u*v/(norm(u)*norm(v));