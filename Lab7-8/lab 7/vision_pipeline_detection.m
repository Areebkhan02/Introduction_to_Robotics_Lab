im = imread('untitled.png');
img = im2double(im);

% Define the red color range in the RGB color space
%red range
min = [0.2 0 0];
max = [0.4 0.16 0.18];

% Threshold the image to extract the red regions
red_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & (img(:,:,3) <= max(3)) & (img(:,:,3) >= min(3));

% Clean up the mask using morphological operations
se = strel('square', 10);
red_mask = imclose(imopen(red_mask, se), se);

% Find connected components in the mask
cc = bwconncomp(red_mask);

% Extract the location of the red cubes as a list of centroids
stats = regionprops(cc, 'Centroid');
red_cubes = cat(1, stats.Centroid);
disp(red_cubes);
disp(size(red_cubes));
% Display the image with the red cubes marked
imshow(img);
hold on;
plot(red_cubes(:,1), red_cubes(:,2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);


% yellow
min = [0.43 0.3 0];
max = [0.6 0.35 1];
yellow_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & (img(:,:,3) <= max(3)) & (img(:,:,3) >= min(3));

% Clean up the mask using morphological operations
se = strel('square', 10);
yellow_mask = imclose(imopen(yellow_mask, se), se);

% Find connected components in the mask
cc = bwconncomp(yellow_mask);

% Extract the location of the red cubes as a list of centroids
stats = regionprops(cc, 'Centroid');
yellow_cubes = cat(1, stats.Centroid);
disp(yellow_cubes);
disp(size(yellow_cubes));
% Display the image with the red cubes marked

plot(yellow_cubes(:,1), yellow_cubes(:,2), 'yo', 'MarkerSize', 10, 'LineWidth', 2);
hold on;
