function ret = idctBlock(matrix, M, N, m, n)

	to_ret = 0;

	for p = 0:1:M-1
		for q = 0:1:N-1
			to_ret += alpha(p,M)*alpha(q,N)*matrix(p+1,q+1)*cos(pi*(2*m+1)*p/(2*M))*cos(pi*(2*n+1)*q/(2*N));
		end		
	end

	ret = to_ret;
end
