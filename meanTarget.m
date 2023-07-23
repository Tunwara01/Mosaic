Size_O = 10;
Im_Crop = 1024;
Total_PIC_CUT = 100;
pic_o = double(imread('D:\Mosaic/GrayS (1).jpg'));
pic = imresize(pic_o,[Im_Crop Im_Crop]);
figure(1)
imshow(uint8(pic))
k = 1;
for j=0:Total_PIC_CUT-1
 b = j*Size_O+1;
for i=0:Total_PIC_CUT-1
 a = i*Size_O+1;
 pic_cut{k} = imcrop(pic,[a b Size_O Size_O]);
 k = k + 1;
end
end
for i=1:(Total_PIC_CUT*Total_PIC_CUT)
 pic_buff = pic_cut{i};
 R = pic_buff(:,:,1);
 G = pic_buff(:,:,2);
 B = pic_buff(:,:,3);
 mean_R_cut(i) = pic_mean(R);
 mean_G_cut(i) = pic_mean(G);
 mean_B_cut(i) = pic_mean(B);
end