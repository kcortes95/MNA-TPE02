%suponemos que la matrix que me pasan por parametro es de 8x8
function ret = MNAdct2(matrix)

	M = 8;
	N = 8;	
	ret = zeros(M,N);

	for p = 0:1:M-1
		for q = 0:1:N-1
			ret(p+1,q+1) = dctBlock(matrix,M,N,p,q);
		end	
	end	

	ret;
	%= round(ret);

end
