z = 0.1:0.05:8; %redshift
Da = zeros(1, length(z)); %angular diameter distance
theta = zeros(1, length(z)); %angular size
omega_M = 1;
omega_lambda = 0;
physical_distance = 1; %Mpc

%applying calculate_dist for a range of z
for i = 1:length(z)
    [Da(i), theta(i)] = calculate_dist(z(i), omega_M, omega_lambda, physical_distance);
end

%creating plots
plot(z, Da, '-k');
title('Angular diameter distance  as a function of redshift');
xlabel('z');
ylabel('Da, Mpc');

figure;
theta = rad2deg(theta);
plot(z, theta, '-k');
title('Angular size as a function of redshift');
xlabel('z');
ylabel('Angular size, degrees');
