function [ dx , dy ] = gradForw( I )
%GRAD Summary of this function goes here
%   Derivatives by symmetric differencing

   
    dx=[I(:,2:end) I(:,end)]-I;   % Forward X Difference
    dy=[I(2:end,:); I(end,:)]-I;  % Forward Y Difference


end

