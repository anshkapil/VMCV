addpath('Helper Functions');

sigma = 1; % try with 3 also
I = double(imread('coins.png'));

[rows, columns] = size(I);
tic

mask = Gaussian2D(sigma); % sigma
im = convolution(I,mask,'mirror');
[height, width] = size(im);
imxprev = im(:,1:width-1);
imxforw = im(:,2:width);
dx = imxforw - imxprev;

imyprev = im(1:height-1,:);
imyforw = im(2:height,:);

dy = imyforw - imyprev;

mag = (dx(1:height-1,:).^2 + dy(:,1:width-1).^2).^0.5;

toc

figure(1)
subplot(1,2,1)
imshow(uint8(im)) % Original Image
title('Gauss Filtered')
hold on
subplot(1,2,2)
imshow(uint8(mag)) % forw diff

title('Magnitude of Gaussian smoothed image')
hold off
