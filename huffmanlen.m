function len = huffmanlen(filename)

%Se guarda la imagen en una matriz con formato uint8
image = imread(filename);
imageInfo = imfinfo(filename);
height = imageInfo.Height;
width = imageInfo.Width;

imaux = image;

%Se crea un diccionario huffman en funcion de los valores de la martiz(imagen)
image = reshape(image,height*width,1);
symbols = unique(image);
freq = hist(image,symbols);
p = freq/sum(freq);
dict = huffmandict(symbols,p);
N = length(symbols);

%Le sumo el tamaño de heigth y width, es decir, 2 enteros de 32bits
len = 2*32;

%le suma la codificacion del minimo
len = len + 32;

%Se suma la longitud en bits de los simbolos
len = len + nextpow2(max(image))*N;

%Se suma la longitud del diccionario
for k = 1:length(symbols)
    len = len + length(dict{k});
endfor


%Se guardan los valores codificados en la imagen y se calcula la longitud de su tamanio
for j = 1:width

    for i = 1:height

        t = 1;
        flag = 1;
        while (t <= N && flag)

            if (imaux(i,j) == symbols(t))
                flag = 0;
                vec{(j-1)*height + i} = dict{t}; %En cada posicion de vec se guarda una cadena binaria
                len = len + length(dict{t});
            endif

            t++;
        endwhile

    endfor

endfor

%Guardo en un archivo la imagen comprimida en codificaion huffman
save huff.save height width symbols dict vec;

end
