tic
load mean_Fruit-hex.mat
Size_O = 10;
Im_Crop = 1024;
Total_PIC_CUT = 100;
pic_mo = double(imread('D:\Mosaic\test/Apple1.1.jpg'));
pic = imresize(pic_mo,[Im_Crop Im_Crop]);
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
n = 255;
cd = 'D:\Mosaic\Fruit-hex/';
aa = '.jpeg';
PIC = (cell((Total_PIC_CUT*Total_PIC_CUT),[]));
A = zeros(Size_O,Size_O,3);
for j=1:(Total_PIC_CUT*Total_PIC_CUT)
for i=1:n
for i=1:n
 error_R(i) = abs(mean_R_sort(i)- mean_R_cut(j))/mean_R_cut(j);
 error_G(i) = abs(mean_G_sort(i)- mean_G_cut(j))/mean_G_cut(j);
 error_B(i) = abs(mean_B_sort(i)- mean_B_cut(j))/mean_B_cut(j);
end
[C,I(1)] = min(error_R);
 [C,I(2)] = min(error_G);
 [C,I(3)] = min(error_B);
 [C,M] = min(I);
if M == 1
name = sprintf('%s%d%s',cd,I(1),aa);
pic = double(imread(name));
 PIC_BUFF{j} = imresize(pic,[10 10]);
break
elseif M==2
name = sprintf('%s%d%s',cd,I(2),aa);
pic = double(imread(name));
 PIC_BUFF{j} = imresize(pic,[10 10]);
break
else M == 3
name = sprintf('%s%d%s',cd,I(3),aa);
pic = double(imread(name));
 PIC_BUFF{j} = imresize(pic,[10 10]);
break
end
end
end
for i=0:Total_PIC_CUT-1
 c = i*Total_PIC_CUT+1;
for j=c:c+(Total_PIC_CUT-1)
PIC{i+1,j-(c-1)} = PIC_BUFF{1,j};
end
end
figure(2)
PICTURE = cell2mat(PIC);
imshow(uint8(PICTURE))
Pic = uint8(PICTURE);
imwrite(Pic,'Apple.test-frh-10x10.jpg');
toc