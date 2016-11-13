%De la india -> https://www.youtube.com/watch?v=UU0tLHsMaOA
function ret = compression(imgpath,destfolder)

	%NECESARIO PARA HACER LAS COSAS!!!
	pkg load image
	pkg load control
	pkg load signal
	pkg load communications

	img = imread(imgpath);
	F = dct2(img); %transformamos con el default
	imwrite(F*0.01,strcat(destfolder,"/F001-imagen.tif"));
	imwrite(F,strcat(destfolder,"/F-imagen.tif"));	
	ff = idct2(F);
	imwrite(ff/255,strcat(destfolder,"/ff255-imagen.tif"));
	imwrite(ff,strcat(destfolder,"/ff-imagen.tif"));

	[r,c] = size(img);
	DF =  zeros(r,c);
	DFF = DF;
	N = 8; %lo hice consistente a lo que tenia yo!! 

	for i = 1 : N : r
		for j = 1 : N : c
			f = img(i:i+N-1,j:j+N-1);
			df = dct2(f);
			DF(i:i+N-1,j:j+N-1) = df;
			dff = idct2(df);
			DFF(i:i+N-1,j:j+N-1) = dff;

		end	
	end

	imwrite(DF/255,strcat(destfolder,'/DF255-imagen.tif'));	
	imwrite(DF,strcat(destfolder,'/DF-imagen.tif'));	
	imwrite(DFF,strcat(destfolder,'/DFF-imagen.tif'));
	imwrite(DFF/255,strcat(destfolder,'/DFF255-imagen.tif'));

end
