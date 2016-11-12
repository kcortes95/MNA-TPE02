%suponemos que la matrix que me pasan por parametro es de 8x8
function ret = MNAidct2(matrix)

	M = 8;
	N = 8;	
	ret = zeros(M,N);

	for m = 0:1:M-1
		for n = 0:1:N-1
			ret(m+1,n+1) = idctBlock(matrix,M,N,m,n);
		end	
	end	

	ret;

end
