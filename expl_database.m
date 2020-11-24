%% plot of the possition
plot(data{1, 2}, data{1, 3}, 'r.');
xlim([0 360]);
xlabel('RA');
ylabel('DEC');
title('Map of object from the catalogue');

%% histogram of magnitude
mag_cleaned = data{1, 8}(data{1, 8} ~= 99);
histogram(mag_cleaned, 100);
xlabel('Magnitude');
ylabel('Frequency');
title('Histogram of magnitudes');
%% barplot galaxies and stars
stars = length(data{1, 4}(data{1, 4} == 2));
galaxy = length(data{1, 4}(data{1, 4} == 1));
undetect = length(data{1, 4}(data{1, 4} == 0));

x = categorical({'stars', 'galaxies', 'undetermined'});
x = reordercats(x, {'stars', 'galaxies', 'undetermined'});
bar(x, [stars, galaxy, undetect]);

ylabel('Number');
title('Number of stars and galaxies');

%% galaxies and stars plot
stars_mask = (data{1, 4} == 2);
galaxy_mask = (data{1, 4} == 1);
plot(data{1, 2}(stars_mask), data{1, 3}(stars_mask), 'r.');
hold on;
plot(data{1, 2}(galaxy_mask), data{1, 3}(galaxy_mask), 'b.');
legend('star', 'galaxy')
xlabel('RA');
ylabel('DEC');

%%
clc;
bad_flag = arrayfun(@sort_flags, data{1, 7});
bad_flag = categorical(bad_flag, [4, 3, 2, 1, 0], {'bad object', ...
    'very likely bad', 'probably bad','probably okay', 'good'}, 'Ordinal', true);
histogram(bad_flag);
title('Object quality');
ylabel('Number');

disp(['Fraction of good objects: ', num2str(length(data{1, 7}(data{1, 7} ~= 0))/length(data{1, 7}))]);
function flag = sort_flags(flag)
if flag >= 8
    flag = 4;
elseif flag >= 4
    flag = 3;
elseif flag >= 2
    flag = 2;
else
    flag = flag;
end
end