function cluster_matrix = find_clusters(likelihood_matrix, no_std)
%function that identifies which parts of the grid have functions

%comparing standard deviation to the threshold sigma value
cluster_matrix = (likelihood_matrix >= no_std);
end