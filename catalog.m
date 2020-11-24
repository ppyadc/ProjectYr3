function cluster_catalog = catalog(cluster_matrix, likelihood_matrix, coord_x, coord_y,...
    new_cell_lengthx, new_cell_lengthy)
%function that  finds position and likelihood of clusters

%finding the indecies of clusters in the grid
[row, col] = find(cluster_matrix);
%calculating x, y coordinates of the centre of the cell
x_vals = coord_x + col*new_cell_lengthx - new_cell_lengthx./2;
y_vals = coord_y + row*new_cell_lengthy - new_cell_lengthy./2;

%calculating likelihood from standard deviation
percent_likelihood = likelihood_matrix(cluster_matrix);

%storing all the information together
cluster_catalog = zeros(length(x_vals), 3);
cluster_catalog(:, 1) = x_vals;
cluster_catalog(:, 2) = y_vals;
cluster_catalog(:, 3) = percent_likelihood;

end