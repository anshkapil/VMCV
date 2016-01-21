function [ dx , dy ] = gradBack( I )
%GRADBACK Summary of this function goes here
%   Detailed explanation goes here

    dx=[I(:,1) I(:,1:end-1)]-I;  % Backward X Difference
    dy=[I(1,:); I(1:end-1,:)]-I; % Backward Y Difference

    
end

