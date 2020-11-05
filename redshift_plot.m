z = 0.1:0.05:8;
Da = zeros(1, length(z));
theta = zeros(1, length(z));

for i = 1:length(z)
    [Da(i), theta(i)] = calculate_dist(z(i), 1, 0, 1);
end

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
