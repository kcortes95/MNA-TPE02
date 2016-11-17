%esto solo funciona si el ancho y el alto son multiplos de 8!
function ret = antitransform(matrix)

  [m,n] = size(matrix);
	ret_img = zeros(m, n);
	
	blocks = 8;

	for w = 1:blocks:n %cols
		for h = 1:blocks:m %fils
			%ret_img(h:h+blocks-1,w:w+blocks-1)
			ret_img(h:h+blocks-1,w:w+blocks-1) = MNAidct2(matrix(h:h+blocks-1,w:w+blocks-1));
		end
	end
	
	ret = ret_img;

end