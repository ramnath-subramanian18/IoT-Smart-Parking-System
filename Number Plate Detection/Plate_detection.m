clc
close all;
clear all;

global noPlate;
noPlate = [];

image = imread('C:\Users\Vagisudar\Downloads\Number Plate Detection (1)\Number Plate Detection\Number Plate Images\image1.png');
figure;
imshow(image);
title('Original Image');
image = rgb2gray(image);
imbin = imbinarize(image,0.4);

per = sum(imbin(:))/numel(imbin) * 100;
if per < 86
    [image,prop] = filterRegions_excludeBorder(imbin);
else
    [image,prop] = filterRegions_includeBorder(imbin);
end

angle = prop.Orientation;
ang = -1*angle;
if abs(angle) > 1 && abs(angle) < 89
    image = imrotate(image,ang);
end
figure;
imshow(image);
title('Rotated Image');

%Below steps are to find location of number plate
Iprops = regionprops(image,'BoundingBox', 'Area', 'Image');
maxa = Iprops.Area;
count = numel(Iprops);
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa < Iprops(i).Area
       maxa = Iprops(i).Area; 
       boundingBox = Iprops(i).BoundingBox;
   end
end 

img = imcrop(image, boundingBox);
[h,w] = size(img);
img = bwareaopen(~img,floor(sqrt(2*h*w)));
figure;
imshow(img);
title('Cropped Number Plate Image');

if w/h < 2
    n = fix(size(img,1)/2);
    img1 = img(1:n,:,:);
    find(img1);
    noPlate1 = noPlate;
    img2 = img(n+1:end,:,:);
    find(img2);
    noPlate = [noPlate1 noPlate];
    disp(noPlate);
else
    find(img);
    disp(noPlate);
end


function find(im)

global noPlate
noPlate = [];
[h,w] = size(im);
Iprops = regionprops(im,'BoundingBox','Area', 'Image'); 
count = numel(Iprops); 

for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow < (w/3) && oh > (h/3)
       Iprops(i).Image = imresize(Iprops(i).Image, [84 44]);
       figure;
       imshow(Iprops(i).Image);
       letter=Letter_detection(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
       noPlate = [noPlate letter]; % Appending every subsequent character in noPlate variable. 
   end
end 
end


