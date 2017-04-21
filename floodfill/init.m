% clear
% clc
% image=imread('bigspiral.png');
% image=rgb2gray(image);
% image(image==137)=0;
% image(image~=0&image~=255)=144;
% list=(image~=144);
% for i=2:4095
%     for j=2:4095
%         if (list(i,j)==1)
%             if (image(i,j+1)==144||image(i,j-1)==144||image(i+1,j)==144||image(i-1,j)==144)
%                 image(i,j)=144;
%             end;
%         end
%     end
% end
% imshow(image);