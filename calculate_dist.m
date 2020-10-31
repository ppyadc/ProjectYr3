function [Da, theta] = calculate_dist(redshift, omega_M, omega_lambda, physical_distance)
%calculate angular diameter distance from redshift

%calculate Hubble distance from Hubble's constant and the speed of light
H0 = 70.*(10.^3);
c = 3.*(10.^8);
Dh = c./H0;

%set Ez as a function of z and calculate it's inverse
%assume omega_k = 0 due to the universe being flat
recip_Ez = @(z) 1./sqrt(omega_M.*(1 + z).^3 + omega_lambda);

%calculate comoving distance from the integral of the inverse of Ez and
%Hubble's distance
Dm = Dh.*integral(recip_Ez, 0, redshift);

%Calculate angular diameter distance 
Da = Dm./(1 + redshift);

%calculate angular size in radians
theta = physical_distance./Da;

end

