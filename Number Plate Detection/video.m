clc
clear all;
close all;

global noPlate;
noPlate = [];
plates = [];

filename = 'C:\Users\Vagisudar\Downloads\Number Plate Detection (1)\Number Plate Detection\Number Plate Images\video2.mp4';
v = VideoReader(filename);
image = read(v,1); 
imgray = rgb2gray(image);
imbin = imbinarize(imgray,0.62);
per = sum(imbin(:))/numel(imbin) * 100;
th = -0.8696662 + 0.1200641*per - 0.002260232*per*per;

num = get(v,'NumberOfFrames');
for k = 2:num
    image = read(v,k); 
    imgray = rgb2gray(image);
    imbin = imbinarize(imgray,0.62);
    per = sum(imbin(:))/numel(imbin) * 100;
    imbin = imbinarize(imgray, th);
    
    if per < 86
        [imbin,prop] = filterRegions_excludeBorder(imbin);
    else
        [image,prop] = filterRegions_includeBorder(imbin);
    end

    %Below steps are to find location of number plate
    Iprops = regionprops(imbin,'BoundingBox', 'Area', 'Image');
    maxa = Iprops.Area;
    count = numel(Iprops); 
    boundingBox = Iprops.BoundingBox;
    for i=1:count
        if maxa < Iprops(i).Area
            maxa = Iprops(i).Area; 
            boundingBox = Iprops(i).BoundingBox;
            img = Iprops(i).Image;
        end
    end  
    
    [h,w] = size(img);  
    if((w/h > 1.7 && w/h < 3.5) || (w/h > 3.8 && w/h < 4.2) || (w/h > 5 && w/h < 5.4)) 
        imshow(image);
        hold on;
        rectangle('Position',boundingBox, 'EdgeColor','g', 'LineWidth',2);
        img = imcrop(imbin, boundingBox);
        img = bwareaopen(~img, floor(sqrt(h*w)));
        [h,w] = size(img);
            
        if(w/h > 1.7 && w/h < 3.5)
            n = fix(size(img,1)/2);
            img1 = img(1:n,:,:);
            find(img1);
            noPlate1 = noPlate;
            img2 = img(n+1:end,:,:);
            find(img2);
            noPlate = [noPlate1 noPlate];
        else
            if((w/h > 3.8 && w/h < 4.2) || (w/h > 5 && w/h < 5.4))
                find(img);
            end
        end
        hold off;
        drawnow;
        plate = char(noPlate);
        if((size(plate,2) == 9) || (size(plate,2) == 10))
            if(size(plates,1) > 15)
                if(size(plates(15,:),2) ~= size(plate,2))
                    break;
                end
            end
            disp(noPlate);
            plates = [plates; plate];
        end
    end
end    
close;

X = size(plates,1);
Y = size(plates,2);
a = [];
numPlate = [];
for i = 1:Y
    for j = 1:X
        a(j) = plates(j,i);
    end
numPlate = [numPlate char(mode(a))];
end

disp("The no. plate is ");
disp(numPlate);


function find(im)
global noPlate;
noPlate = [];

[h,w] = size(im);
Iprops = regionprops(im,'BoundingBox','Area', 'Image'); 
count = numel(Iprops); 

for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow < (w/3) && oh > (h/3)
       Iprops(i).Image = imresize(Iprops(i).Image, [84 44]);
       letter = Letter_detection(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
       noPlate = [noPlate letter]; % Appending every subsequent character in noPlate variable. 
   end
end 
end