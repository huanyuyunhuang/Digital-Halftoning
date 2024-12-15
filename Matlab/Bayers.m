
clc
clear;
 
im=imread('Lena.jpg');
A=rgb2gray(im);
figure(1)
imshow(A)
B=Bayers_1(A,1);
figure(2);
imshow(B);
C=Bayers_1(A,2);
figure(3);
imshow(C);
D=Bayers_1(A,3);
figure(4);
imshow(D);
function [HOD]=Bayers_1(im,met)
[s1 s2]=size(im);%获得图像的大小
im=im2double(im);%图像双精度化
if (met==1)
%Bayers Dispersed Dot

DA=[00 48 12 60 03 51 15 63;
    32 16 44 28 35 19 47 31;
    08 56 04 52 11 59 07 55;
    40 24 36 20 43 27 39 23;
    02 50 14 62 01 49 13 61;
    34 18 46 30 33 17 45 29;
    10 58 06 54 09 57 05 53;
    42 26 38 22 41 25 37 21]/64;

elseif (met==2)
%Bayers Clustered Dot

DA=[24 10 12 26 35 47 49 37;
    08 00 02 14 45 59 61 51;
    22 06 04 16 43 57 63 53;
    30 20 18 28 33 41 55 39;
    34 46 48 36 25 11 13 27;
    44 58 60 50 09 01 03 15;
    42 56 62 52 23 07 05 17;
    32 40 54 38 31 21 19 29;]/64;

else
    DA=double(rand(8,8));
end

mask=repmat(DA,s1/8,s2/8);%repmat平铺函数，将抖动矩阵赋值s1/8*s2/8块存储
H=zeros(s1,s2);
HOD=im>mask;

end
