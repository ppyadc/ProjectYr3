close all;
clear all;
clc;

load filter_data.mat

%ind_ra = (filter_data(:, 2) > 70 & filter_data(:, 2) < 71);
%data = filter_data(ind_ra, :);
ind_dec = (filter_data(:, 3) < -50 & filter_data(:, 3) > -60);
data = filter_data(ind_dec, :);
%describing data with parametes
coord_x = 65;
coord_y = -60;
grid_lengthx = 10;
grid_lengthy = 10;

redshift = 0.3; %redshift
%physical constants
omega_M = 0.3166;
omega_lambda = 0.6847;
physical_distance = 1;

%cell length
[Da, theta] = calculate_dist(redshift, omega_M, omega_lambda, physical_distance)
cell_lengthx = theta;
cell_lengthy = theta;
no_std = 2;

x = data(:, 2)';
y = data(:, 3)';

%sorting coordinates
[grid, nx, ny, new_cell_lengthx, new_cell_lengthy] = sort_grid(x, y, grid_lengthx,...
    grid_lengthy, cell_lengthx, cell_lengthy, coord_x, coord_y);
%calculating number of galaxies in each section of the grid
no_gal = counting_gal(grid);
%setting threshold value to be a galaxy candidate
[threshold_no_gal, mean_no_gal, sigma] = find_threshold(no_gal, no_std);
%calculating stangard deviation away from the mean for number of
%galaxies in each cell
likelihood_matrix = likelihood(no_gal, mean_no_gal, sigma);
%determine which cells are above the threshold
cluster_matrix = find_clusters(likelihood_matrix, no_std);

%plotting heatmaps and positions of cluster candidates
plotting(grid_lengthx, grid_lengthy, nx, ny, no_gal, likelihood_matrix, ...
   cluster_matrix, x, y, coord_x, coord_y);
%main info about cluster candidates
cluster_catalog = catalog(cluster_matrix, likelihood_matrix, coord_x, coord_y, ...
    new_cell_lengthx, new_cell_lengthy);
%%
%histogram
hist(likelihood_matrix(:), 15);
xlabel('Standard deviation away from the mean');
ylabel('Frequency');
