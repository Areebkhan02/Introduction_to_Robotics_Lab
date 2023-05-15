
%%
% Clear the command window and any existing variables
clc;
clear;

% Read in the image and convert it to a double precision format
im = imread('untitled.png');
img = im2double(im);

% Define the color ranges for the cubes in the RGB color space
color_ranges = [0.2 0 0 0.4 0.16 0.18%red
    0.43 0.3 0 1 0.35 1%yellow
    0.02 0.24 0.2 0.2 0.31 0.3%green
    0 0.2 0.4 0 0.5 0.5];%blue

% Create an empty array to store the centroids of the detected cubes
all_cubes = [];

% Loop through each color range and detect the cubes in that color
for i = 1:4
    % Define the minimum and maximum values for the color range
    min = color_ranges(i, 1:3);
    max = color_ranges(i, 4:6);
    
    % Create a binary mask that is true for all pixels that fall within the specified color range
    color_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & ...
                 (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & ...
                 (img(:,:,3) >= min(3)) & (img(:,:,3) <= max(3));
    
    % Clean up the mask using morphological operations to remove any small holes or gaps in the color regions
    se = strel('square', 10);
    color_mask = imclose(imopen(color_mask, se), se);
    
    % Find connected components in the mask (i.e. clusters of adjacent pixels that are true)
    cc = bwconncomp(color_mask);
    
    % Extract the centroid locations of each connected component as a list of points
    stats = regionprops(cc, 'Centroid');
    
    % Append the centroids to the list of all cubes
    all_cubes = [all_cubes; cat(1, stats.Centroid)]
end

% Display the number and coordinates of the detected cubes for each color
for i = 1:4
    
    color_name = ['Red', 'Yellow', 'Green', 'Blue']
    color_cubes = all_cubes((i-1)*cc.NumObjects+1:i*cc.NumObjects, :)
    disp([color_name(i) ' cubes:'])
    disp(color_cubes)
    disp(size(color_cubes))
    %fprintf("error check\n")
end

% Display the original image with the detected cubes marked as colored circles
imshow(img);
hold on;
colors = ['r', 'y', 'g', 'b'];
for i = 1:size(color_ranges, 1)
    color_cubes = all_cubes((i-1)*cc.NumObjects+1:i*cc.NumObjects, :);
    plot(color_cubes(:,1), color_cubes(:,2), [colors(i) 'o'], 'MarkerSize', 10, 'LineWidth', 2);
end
%%
X=403;Y=306;
red_cubes=all_cubes(1,:);blue_cubes=all_cubes(4,:);green_cubes=all_cubes(3,:);yellow_cubes=all_cubes(2,:);
R_CUBE_COORD=[red_cubes(1,1)-X red_cubes(1,2)-Y]
B_CUBE_COORD=[blue_cubes(1,1)-X blue_cubes(1,2)-Y]
G_CUBE_COORD=[green_cubes(1,1)-X green_cubes(1,2)-Y]
Y_CUBE_COORD=[yellow_cubes(1,1)-X yellow_cubes(1,2)-Y]
