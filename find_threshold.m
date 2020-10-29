function threshold_no_gal = find_threshold(no_gal, no_std)

%calculate mean number of galaxy in each section of the cell
mean_no_gal = mean(no_gal, 'all');

%caluclate unbaised standard deviation of the data
sigma = std( no_gal(:) );

%calculate minimum number of galaxies that would indicate a cluster, with an input
%uncertainty as a number of standard deviations away from the mean 
threshold_no_gal = ceil(mean_no_gal + no_std.*sigma);

end