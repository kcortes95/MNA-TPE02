function ret = dctBlock(matrix, M, N, p, q)

	to_ret = 0;

	for m = 0:1:M-1
		for n = 0:1:N-1
			to_ret += matrix(m+1,n+1)*cos(pi*(2*m+1)*p/(2*M))*cos(pi*(2*n+1)*q/(2*N));
		end		
	end

	ret = to_ret*alpha(p,M)*alpha(q,N);
	%ret = 5
end
