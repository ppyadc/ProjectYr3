function [no_gal, filter_matrix] = remove_empty_space(likelihood_matrix, no_gal)
%function sets empty or nearly empty cells in number of galaxies matrix(no_gal) to Nan

%conditions to declare matix empty or nearly empty
filter_matrix = ((no_gal == 0) | (likelihood_matrix < -3.5));
%setting empty cell values to Nan
no_gal(filter_matrix) = NaN;

end