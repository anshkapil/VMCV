function [ dx , dy ] = grad( I )
%GRAD Summary of this function goes here
%   Detailed explanation goes here

   dx =  (I(:, [2:end end])   - I(: , [1 1:end-1]))/2 ;
   dy =  (I([2:end end], :)   - I([1 1:end-1] , :))/2 ;





end

