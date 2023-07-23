clear;
close all;
clc
a=1024;
pic=imread('Apple1.1.jpg'); % target
I=imresize(pic,[a a]);
R=I(:, :, 1);
G=I(:, :, 2);
B=I(:, :, 3);
pic_mo=imread('Apple1.1-fr-mode-mode.jpeg'); % mosaic
I_mosaic=imresize(pic_mo,[a a]);
R_m=I_mosaic(:, :, 1);
G_m=I_mosaic(:, :, 2);
B_m=I_mosaic(:, :, 3);
psnr_red = psnr1(R, R_m)
psnr_green = psnr1(G, G_m)
psnr_blue = psnr1(B, B_m)