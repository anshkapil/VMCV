function [ u ] = denoiseEnergy( f, lambda , iter , step )
%DENOISEENERGY Summary of this function goes here
%   Detailed explanation goes here

u = f;



for i = 1:iter

    [dx , dy] = grad(u);

    norm = (dx.^2 + dy.^2).^0.5 + 0.01;
    [dxx , ~] = grad(dx./(norm));
    [~, dyy] = grad(dy./(norm));

    div = dxx + dyy;

    delE_by_delU = lambda*( u - f ) - div;  

    u = u - step*delE_by_delU;
    
end


end

