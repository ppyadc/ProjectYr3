
function [grid, nx, ny, new_cell_lengthx, new_cell_lengthy] = sort_grid(x, y,...
    grid_lengthx, grid_lengthy, cell_lengthx,cell_lengthy, coord_x, coord_y)

%input values and sort into cell where  it's indices describe the
%location of the x-y coordinate on the grid

%cell_lengthx and cell_lengthy are approximate input values

%outputs are cell of galaxy locations and dimensions of the grid

%moving grid to position (0,0)
y = y - coord_y;
x = x - coord_x;

%finding the dimensions of the cell
nx = round(grid_lengthx./cell_lengthx); 
ny = round(grid_lengthy./cell_lengthy);

%setting up empty cell
grid = cell(nx, ny);

%calculate new cell lengths from the grid dimensions
new_cell_lengthx = grid_lengthx./nx;
new_cell_lengthy = grid_lengthy./ny;

%loop for put each location into a section of the cell 
for i = 1:length(x)
    
    %find the section of the cell in which each x-y coordinate belongs
    position_x = ceil(x(i)./new_cell_lengthx);
    position_y = ceil(y(i)./new_cell_lengthy);
    
    %find number of coordinates in sections of the cell
    length_section = size(grid{position_y, position_x}, 2);
    
    %place coordinates in correct section
    grid{position_y, position_x}(1, length_section + 1) = x(i);
    grid{position_y, position_x}(2, length_section + 1) = y(i);
    
end
end



