close all;
x = [1 + rand(1, 100), 1.2 + 0.2.*rand(1, 15), 1.4 + 0.2.*rand(1, 12)];
y = [-1 + rand(1, 100), -.2 - 0.2.*rand(1, 15), -.8 - 0.2.*rand(1, 12)];

coord_x = 1;
coord_y = -1;
grid_lengthx = 1;
grid_lengthy = 1;
cell_lengthx = 0.2;
cell_lengthy = 0.2;
no_std = 2;

z = 3;
omega_M = 0.3166;
omega_lambda = 0.6847;

[grid, nx, ny, new_cell_lengthx, new_cell_lengthy] = sort_grid(x, y, grid_lengthx,...
    grid_lengthy, cell_lengthx, cell_lengthy, coord_x, coord_y);
no_gal = counting_gal(grid)
[threshold_no_gal, mean_no_gal, sigma] = find_threshold(no_gal, no_std);
likelihood_matrix = likelihood(no_gal, mean_no_gal, sigma)
plotting(grid_lengthx, grid_lengthy, nx, ny, no_gal, likelihood_matrix, ...
    cluster_matrix, x, y, coord_x, coord_y);

cluster_matrix = find_clusters(likelihood_matrix, no_std)
cluster_catalog = catalog(cluster_matrix, likelihood_matrix, coord_x, coord_y, ...
    new_cell_lengthx, new_cell_lengthy)
