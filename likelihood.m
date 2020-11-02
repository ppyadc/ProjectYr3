function likelihood_matrix = likelihood(no_gal, mean_no_gal, sigma)
%function to find the probability of each section of the grid containing a
%cluster

%use gaussian distribution to calculate teh probabilities
likelihood_matrix = normcdf(no_gal, mean_no_gal, sigma);

end