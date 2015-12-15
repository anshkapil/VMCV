close all;

I = im2double(imread('lena.pgm'));

J = diffusion_filter(I,'pm1',100);

imshow(J)