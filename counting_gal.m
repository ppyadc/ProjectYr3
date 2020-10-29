function no_gal = counting_gal(grid)
%input grid and turn into matrix where each value is the number of galaxies
%within each section of the cell

%applying size fucntion to each section of the cell
no_gal = cellfun(@(no_gal) size(no_gal, 2), grid, 'uni', false);

%turn cell into matrix
no_gal = cell2mat(no_gal);

end