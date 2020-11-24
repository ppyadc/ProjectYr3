close all;
clear all;
clc;

%describing data with parametes
coord_x = 1;
coord_y = -1;
grid_lengthx = 1;
grid_lengthy = 1;
cell_lengthx = 0.1;
cell_lengthy = 0.1;
no_std = 3;

z = 3; %redshift
%physical constants
omega_M = 0.3166;
omega_lambda = 0.6847;


sample_number = 1; %number of runs
cluster_detect = 0; %cluster candidates
correct_cluster = 0; %expected clusters

clusters = [1.25, -0.25; 1.45, -0.85]; %positions of clusters

%arrays for staoing values
sigma_arr = zeros(1, sample_number); % array of std
mean_arr = zeros(1, sample_number); %array of means
sigma_clusters = zeros(5, sample_number); %array of std away from the mean for cluster candidates

for i=1:sample_number
    %coordinates of galaxies
    x = [1 + rand(1, 500), 1.2 + 0.1.*rand(1, 15), 1.4 + 0.1.*rand(1, 15)];
    y = [-1 + rand(1, 500), -.2 - 0.1.*rand(1, 15), -.8 - 0.1.*rand(1, 15)];

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
    
    %storing mean and std
    sigma_arr(1, i) = sigma;
    mean_arr(1, i) = mean_no_gal;
    
    %storing sigmas of cluster candidates and detemining if it's a cluster
    %we expect
    for j=1:length(cluster_catalog(:, 3))
        sigma_clusters(j, i) = cluster_catalog(j, 3);
        %is candidate an expected cluster?
        if round(cluster_catalog(j, 1:2), 3) == clusters(1, :)
            correct_cluster = correct_cluster + 1;
        elseif round(cluster_catalog(j, 1:2), 3) == clusters(2, :)
            correct_cluster = correct_cluster + 1;
        end
        
        cluster_detect = cluster_detect + 1;   
    end

end
sigma_mean = mean(sigma_arr) % mean of standard deviation
mean_mean = mean(mean_arr) %average(mean) of mean
mean_gal_sigma = mean(sigma_clusters, 'all') %mean of sigma for cluster candidates
min_sigma = min(sigma_clusters, [], 2) %min sigma
max_sigma = max(sigma_clusters, [], 2) %max sigma
