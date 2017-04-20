clc
clear all
close all
imdata = rgb2gray(imread('pic.png'));
imshow(imdata);
BinSer=dec2bin(imdata,8);	BinSer=BinSer';
FileName=[num2str(size(imdata,1)),'_',num2str(size(imdata,2)),'_',num2str(size(imdata,3)),'.txt']
fid=fopen(FileName,'w');
fprintf(fid,'%c',BinSer(:));
fclose(fid);
clear all
figure;
FileName='650_600_3.txt';		%文件名为上述生成的文件名
mn=sscanf(FileName,'%d_%d_%d');	
M=mn(1);	N=mn(2);	K=mn(3);
fid=fopen(FileName,'r');
data=fscanf(fid,'%c');
fclose(fid);
data1=reshape(data,8,length(data)/8);
data2=reshape(bin2dec(data1'),M,N,K);
imshow(uint8(data2));