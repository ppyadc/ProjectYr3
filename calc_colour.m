function filter_data = calc_colour(filter_data)

%coulur callculated by  r_mag - i_mag
colour = filter_data(:, 8) - filter_data(:, 9);
filter_data = [filter_data, colour];

end
