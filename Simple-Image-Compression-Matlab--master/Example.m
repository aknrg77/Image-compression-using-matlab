% Image Compressor
% Compresses to 1/3 size

old_rgb_1 = imread('moon.jpg');       % Comvert jpg to rgb
comp_rgb_1 = compress(old_rgb_1);       % Compress image
uncomp_rgb_1 = decompress(comp_rgb_1);  % Uncompress image
imwrite(comp_rgb_1,'image1new.jpg');    % Convert back to jpg


% Display the original and new images side-by-side
figure(1);
subplot(1,2,1);
image(old_rgb_1);
title('Precompressed Image');
subplot(1,2,2);
image(uncomp_rgb_1);
title('Compressed Image');

