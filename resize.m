av_files = dir(fullfile('D:\Mosaic\colorfull/*.jpg'))
n = 146;
a = '.jpeg';
for i=1:n;
filesname=av_files(i).name;
t = strcat(filesname);
cd(['D:\Mosaic\colorfull'])
I=imread(t);
J=imresize(I,[256,256]);
new_filesname = sprintf('%d%s',i,a) ;
imwrite(J,new_filesname) % jpeg
end