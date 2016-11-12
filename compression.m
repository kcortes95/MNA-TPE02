%De la india -> https://www.youtube.com/watch?v=UU0tLHsMaOA
function ret = compression(imgpath)

	pkg load control
	pkg load signal
	pkg load image


	img = imread(imgpath);
	figure, imshow(img);
	F = dct2(img);
	figure,imshow(F*0.01);
	ff = idct2(F);
	figure,imshow(ff/255);

	[r,c] = size(img);
	DF =  zeros(r,c);
	DFF = DF;
	IDF = DF;
	IDFF = DF;
	depth = 4;
	N = 8; %lo hice consistente a lo que tenia yo!! 

	for i = 1 : N : r
		for j = 1 : N : c
			f = img(i:i+N-1,j:j+N-1);
			df = dct2(f);
			DF(i:i+N-1,j,j+N-1) = df;
			dff = MNAidct2(df);
			DFF(i:i+N-1,j:j+N-1) = dff;

			df(N:-1:depth+1,:) = 0;
			df(:,N:-1:depth+1)=0;
			IDF(i:i+N-1,j:j+N-1) = df;
			dff = idct2(df);
			IDFF(i:i+N-1,j:j+N-1) = dff;
		end	
	end

	figure,imshow(DF/255);
	figure,imshow(DFF);
	A=DFF/255;
	figure, imshow(A);
	imwrite(A,'~/Escritorio/testing1.tif');

	B = IDFF/255;
	imwrite(B,'~/Escritorio/testing2.tif');
	figure,imshow(B);	

end
