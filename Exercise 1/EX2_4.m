im = double(imread('coins.png'));
[height, width] = size(im);

tic
imxprev = im(:,1:width-1);
imxforw = im(:,2:width);
dx = imxforw - imxprev;

imyprev = im(1:height-1,:);
imyforw = im(2:height,:);

dy = imyforw - imyprev;

toc

figure(1)
subplot(1,2,1)
imshow(uint8(im)) % Original Image
title('Original')
hold on
subplot(1,2,2)
imshow(uint8(dx)) % forw diff

title('DX')
hold off

figure(2)
subplot(1,2,1)
imshow(uint8(im)) % Original Image
title('Original')
hold on
subplot(1,2,2)
imshow(uint8(dy)) % forw diff

title('DY')
hold off
