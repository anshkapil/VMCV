function Jd=diffusion_filter(J,method,N,K,dt)
% private function: diffusion (by Guy Gilboa, corrected by Thomas Brox):
% Jd=diffusion(J,method,N,K)
% Simulates N iterations of diffusion, parameters:
% J =  source image (2D gray-level matrix) for diffusio
% method =  'lin':  Linear diffusion (constant c=1).
%           'pm1': perona-malik, c=exp{-(|grad(J)|/K)^2} [PM90]
%           'pm2': perona-malik, c=1/{1+(|grad(J)|/K)^2} [PM90]
% K    edge threshold parameter
% N    number of iterations
% dt   time increment (0 < dt <= 0.25, default 0.2)

if ~exist('N')
    N=1;
end
if ~exist('K')
    K=1;
end
if ~exist('dt')
    dt=0.2;
end
if ~exist('sigma2')
    sigma2=0;
end

[Ny,Nx]=size(J); 

if (nargin<3) 
    error('not enough arguments (at least 3 should be given)');
end
v = VideoWriter(strcat(method,'-Diffusion.avi'));
open(v)

for i=1:N;   
    
    % calculate gradient magnitude for diffusivities
    Iy=(J([2:end end],:)-J([1 1:end-1],:))/2;
    Ix=(J(:,[2:end end])-J(:,[1 1:end-1]))/2;
    D=(Ix.*Ix)+(Iy.*Iy);

    % calculate diffusivities
    if (method == 'lin')
        G=1;
    elseif (method == 'pm1')
        G=exp(-(D/K^2));
    elseif (method == 'pm2')
        G=1./(1+(D/K^2));
    else
        error(['Unknown method "' method '"']);
    end
    
    % calculate one-sided differences
    In=[J(1,:); J(1:Ny-1,:)]-J; % Forward Y Difference
    Is=[J(2:Ny,:); J(Ny,:)]-J;  % Backward Y Difference
    Ie=[J(:,2:Nx) J(:,Nx)]-J;   % Backward X Difference
    Iw=[J(:,1) J(:,1:Nx-1)]-J;  % Forward X Difference

    % Next Image J

    % calculate one-sided differences
    if(~strcmp(method ,'lin'))
        Gn=[G(1,:); G(1:Ny-1,:)].*G; % Forward Y PRODUCT
        Gs=[G(2:Ny,:); G(Ny,:)].*G;  % Backward Y PRODUCT
        Ge=[G(:,2:Nx) G(:,Nx)].*G;   % Backward X PRODUCT
        Gw=[G(:,1) G(:,1:Nx-1)].*G;  % Forward X PRODUCT
        
        J = J + dt*(sqrt(Gs).*Is + sqrt(Gn).*In + sqrt(Ge).*Ie + sqrt(Gw).*Iw);
    else
        J = J + dt*(Is + In + Ie + Iw);
    end
    writeVideo(v,im2double(J))
end; % for i
    close(v);
Jd = J;


%%%% Refs:
% [PM90] P. Perona, J. Malik, "Scale-space and edge detection using anisotropic diffusion", PAMI 12(7), pp. 629-639, 1990. 
% [CLMC92] F. Catte, P. L. Lions, J. M. Morel and T. Coll, "Image selective smoothing and edge detection by nonlinear diffusion", SIAM J. Num. Anal., vol. 29, no. 1, pp. 182-193, 1992.
% [GSZ01] G. Gilboa, N. Sochen, Y. Y. Zeevi, "Complex Diffusion Processes for Image Filtering", Scale-Space 2001, LNCS 2106, pp. 299-307, Springer-Verlag 2001.

