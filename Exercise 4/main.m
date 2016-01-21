
f = im2double(imread('lena.pgm'));
lambda = 0.9;
iter = 500;
step = 0.001;
%u = denoise(f, lambda);

u_star = denoiseEnergy( f , lambda , iter , step );

figure;
imshow( uint8(u_star*255) );
