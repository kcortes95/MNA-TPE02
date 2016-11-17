%De la india -> https://www.youtube.com/watch?v=UU0tLHsMaOA
function ret = compression(imgpath,destfolder)

	%NECESARIO PARA HACER LAS COSAS!!!
	pkg load image
	pkg load control
	pkg load signal
	%pkg load communications

	img = imread(imgpath);
	F = dct2(img); %transformamos con el default
	imwrite(F*0.01,strcat(destfolder,"/F001-imagen.bmp"));
  
  imwrite(F,strcat(destfolder,"/F-imagen.bmp"));	
	ff = idct2(F);
  
	imwrite(ff/255,strcat(destfolder,"/ff255-imagen.bmp"));
	imwrite(ff,strcat(destfolder,"/ff-imagen.bmp"));

	[r,c] = size(img);
	DF =  zeros(r,c);
	DFF = DF;
	N = 8; %lo hice consistente a lo que tenia yo!! 
  "Antes del doble ciclo"
	for i = 1 : N : r
		for j = 1 : N : c
			f = img(i:i+N-1,j:j+N-1);
      f
      df2 = MNAdct2(f)
			df1 = dct2(f)
      

			DF(i:i+N-1,j:j+N-1) = df1;
			dff = idct2(df1);
			DFF(i:i+N-1,j:j+N-1) = dff;
		end	
	end
  
	imwrite(DF/255,strcat(destfolder,'/DF255-imagen.bmp'));	
	imwrite(DF,strcat(destfolder,'/DF-imagen.bmp'));	
	imwrite(DFF,strcat(destfolder,'/DFF-imagen.bmp'));
	imwrite(DFF/255,strcat(destfolder,'/DFF255-imagen.bmp'));

end
