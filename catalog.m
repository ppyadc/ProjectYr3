function cluster_catalog = catalog(cluster_matrix, likelihood_matrix, coord_x, coord_y,...
    new_cell_lengthx, new_cell_lengthy, mean_no_gal, num_cluster, connect_clusters, nx, ny, no_gal)
%function that  finds position and likelihood of clusters

%preallocate empty arrays to store values
richness = zeros(1, num_cluster);
x_pos = zeros(1, num_cluster);
y_pos = zeros(1, num_cluster);
percent_likelihood = zeros(1, num_cluster);

%loop iterating over connected clusters
for i=1:num_cluster
    %linear index
    indx = find(connect_clusters == i);
    %2d index
    [xx, yy] = ind2sub([nx, ny], indx);
    %cluster_catalog_new{i, 1} = indx;
    
    percent_likelihood(i) = mean(likelihood_matrix(indx), 'all');
    richness(i) = sum(no_gal(indx') - mean_no_gal);
    %coordinates of the center of the cluster
    x_pos(i) = sum(xx'.*(no_gal(indx') - mean_no_gal))./richness(i);
    y_pos(i) = sum(yy'.*(no_gal(indx') - mean_no_gal))./richness(i);
end

%calculating x, y coordinates of the centre of the cell
x_vals = coord_x + x_pos*new_cell_lengthx - new_cell_lengthx./2;
y_vals = coord_y + y_pos*new_cell_lengthy - new_cell_lengthy./2;

%calculating likelihood from standard deviation
%percent_likelihood = likelihood_matrix(cluster_matrix);

%storing all the information together
cluster_catalog = zeros(num_cluster, 4);
cluster_catalog(:, 1) = x_vals;
cluster_catalog(:, 2) = y_vals;
cluster_catalog(:, 3) = percent_likelihood;
cluster_catalog(:, 4) = richness;

end