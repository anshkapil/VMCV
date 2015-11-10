addpath('Helper Functions');

sigma = 1; % try with 3 also
I = double(imread('coins.png'));

[rows, columns] = size(I);

mask = Gaussian2D(sigma); % sigma
tic
convoluted_image1 = convolution(I,mask,'mirror');
toc
figure(1)
subplot(1,2,1)
imshow(uint8(I)) % Original Image
title('Original')
hold on
subplot(1,2,2)
imshow(uint8(convoluted_image1)) % Original Image

title(strcat('2D Gaussian sigma = ',num2str(sigma)))
hold off

