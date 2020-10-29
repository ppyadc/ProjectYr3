function plotting(grid_lengthx, grid_lengthy, nx, ny, no_gal)
%function to produce a plot of the number of galaxies in each section of
%the grid displayed as different colours

%finding half the length of each cell
half_cellx = 0.5.*grid_lengthx./nx;
half_celly = 0.5.*grid_lengthy./ny;

%setting limits on the axes so that the colours are displayed correctly
%with the sections of the cell
x = [0+half_cellx grid_lengthx-half_cellx];
y = [0+half_celly grid_lengthy-half_celly];

%plotting the data with a colour bar
imagesc(x, y, no_gal);
colorbar;
colormap winter;

%setting the placement of the grid lines to show the boundaries of each
%cell
set(gca, 'xtick', linspace(0, grid_lengthx, nx + 1));
set(gca, 'ytick', linspace(0, grid_lengthy, ny + 1));
grid on

end