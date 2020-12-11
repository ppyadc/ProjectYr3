
%data = fitsread('sva1_gold_r1.0_catalog_trim.fits', 'binarytable');
%data_mat = cell2mat(data);
%%


for i = 1:size(cluster_catalog, 1)
    
x_centre = cluster_catalog(i,1);
y_centre = cluster_catalog(i,2);

half_cellx = new_cell_lengthx./2;
half_celly = new_cell_lengthy./2;

index_cluster_ra = (filter_data(:,2) > (x_centre - half_cellx)) & (filter_data(:,2) < (x_centre + half_cellx));
cluster_data = filter_data(index_cluster_ra, :);

index_cluster_dec = (cluster_data(:,3) > (y_centre - half_celly)) & (cluster_data(:,3) < (y_centre + half_celly));
cluster_data = cluster_data(index_cluster_dec, :);

cluster_mag_r = cluster_data(:, 8);
colour = cluster_data(:, 14);

figure;
plot(cluster_mag_r, colour, '*');
title(['Colour-Magnitude diagram of cluster at (', num2str(x_centre), ',', num2str(y_centre), ')']);
xlabel('Magnitude');
ylabel('Colour');
end
