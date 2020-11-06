function plotting(grid_lengthx, grid_lengthy, nx, ny, no_gal, likelihood_matrix, ...
    cluster_matrix, x, y, coord_x, coord_y)
%function to produce a plot of the number of galaxies in each section of
%the grid displayed as different colours

%finding half the length of each cell
half_cellx = 0.5.*grid_lengthx./nx;
half_celly = 0.5.*grid_lengthy./ny;

%setting limits on the axes so that the colours are displayed correctly
%with the sections of the cell
x_arr = [0+half_cellx+coord_x grid_lengthx-half_cellx+coord_x];
y_arr = [0+half_celly+coord_y grid_lengthy-half_celly+coord_y];

%plotting the data with a colour bar
imagesc(x_arr, y_arr, no_gal); hold on;
plot(x, y, 'rx');
colorbar;
colormap winter;


%plot likelihood matrix
figure;
imagesc(x_arr, y_arr, likelihood_matrix);
colorbar;

%plot where galaxy clusters are
figure;
imagesc(x_arr, y_arr,cluster_matrix);
colorbar;

end