tic
close all
clear all
clc
n = 255;
cd = 'D:\Mosaic\Fruit-hex/';
a = '.jpeg';
for i=1:n
name = sprintf('%s%d%s',cd,i,a);
pic = double(imread(name));
%figure(1); imshow(uint8(pic))
 R = pic(:,:,1);
 G = pic(:,:,2);
 B = pic(:,:,3);
 mean_R(i) = pic_mean(R);
 mean_G(i) = pic_mean(G);
 mean_B(i) = pic_mean(B);
clear pic;
 mean_R_sort = sort_value (mean_R);
 mean_G_sort = sort_value (mean_G);
 mean_B_sort = sort_value (mean_B);
end
toc