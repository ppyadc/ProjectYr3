function cluster_catalog = catalog(cluster_matrix, likelihood_matrix, coord_x, coord_y, new_cell_lengthx, new_cell_lengthy)
[row, col] = find(cluster_matrix);
x_vals = coord_x + col*new_cell_lengthx - new_cell_lengthx./2
y_vals = coord_y + row*new_cell_lengthy - new_cell_lengthy./2

percent_likelihood = normcdf(likelihood_matrix(cluster_matrix))

cluster_catalog = zeros(length(x_vals), 3);
cluster_catalog(:, 1) = x_vals;
cluster_catalog(:, 2) = y_vals;
cluster_catalog(:, 3) = percent_likelihood;

end