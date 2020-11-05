function cluster_matrix = find_clusters(likelihood_matrix, no_std)

cluster_matrix = (likelihood_matrix >= no_std);
end