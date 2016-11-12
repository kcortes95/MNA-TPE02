%esto solo funciona si el ancho y el alto son multiplos de 8!
function ret = transform(imagePath)

	img = imread(imagePath);
	%imshow(img);
	info = imfinfo(imagePath);
	ret_img = zeros(info.Width, info.Height);
	
	blocks = 8;

	for w = 1:blocks:info.Width %cols
		for h = 1:blocks:info.Height %fils
			ret_img(h:h+blocks,w:w+blocks) = MNAdct2(img(h:h+blocks,w:w+blocks));
		end
	end
	
	ret = ret_img;

end
