# Integer FFT and Image Compression
### MNA - ITBA

Funciones realizadas en Octave:
  - alpha.m
  - antitransform.m
  - transform.m
  - compression.m >> para ser eliminado
  - dctBlock.m
  - idctBlock.m
  - MNAdct2.m
  - MNAidct2.m

Además incluye: 
   - example.bmp (imagen en escala de grises de 128x128)

#### Instalación
##### Octave
  Para LINUX
 ```sh
sudo add-apt-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave
```
Una vez instalado Octave, por consola instalar liboctave-dev
 ```sh
sudo apt-get install liboctave-dev
```
Para poder utilizar ciertas funciones para tratamiento de imágenes, dct2 e idct2, en Octave:
```sh
pkg install -forge control
pkg install -forge signal
pkg install -forge image
```
Cada vez que utilicemos una función de éstas, se debe cargar previamente
```sh
pkg load control
pkg load signal
pkg load image
```
Para cargar nuestras funciones en Octave
```sh
addpath("~/Escritorio/MNA-2016")
```
#### Links importantes
  - https://www.mathworks.com/help/images/ref/dct2.html
  - https://www.mathworks.com/help/images/ref/dct2.html
  - https://www.youtube.com/watch?v=UU0tLHsMaOA



