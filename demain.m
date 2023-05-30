clear ;clc;close all;
%% 密钥读取
P0=imread('./misc/4.1.01.tiff');
C=imread('./C/4.1.01.png');
[h,w,~] = size(C);
% w=w/3;
CR = C(:,:,1);CG = C(:,:,2);CB = C(:,:,3);
%% B通道
% 序列生成
CG=double(CG);
[s1,s2,s3,s4,s5]=chaotic_2d(CG);
% 解置乱
IB1 = dediffusion0(CB,s5);
%解RNA加密
IB2=deRNAcoding(IB1,s2,s3,s4);
%解置换
IB3 = deconfusion0(IB2,s1);
figure(1)
subplot(221)
imshow(uint8(IB3))
%% G通道
% 序列生成
CR=double(CR);
[s1,s2,s3,s4,s5]=chaotic_2d(CR);
% 解置乱
IG1 = dediffusion0(CG,s5);
%解RNA加密
IG2=deRNAcoding(IG1,s2,s3,s4);
%解置换
IG3 = deconfusion0(IG2,s1);
subplot(222)
imshow(uint8(IG3))
%% R通道
% 序列生成
[s1,s2,s3,s4,s5]=chaotic_2d(P0);
% 解置乱
IR1 = dediffusion0(CR,s5);
%解RNA加密
IR2=deRNAcoding(IR1,s2,s3,s4);
%解置换
IR3 = deconfusion0(IR2,s1);
subplot(223)
imshow(uint8(IR3))

%% 图像
C(:,:,1)=IR3;C(:,:,2)=IG3;C(:,:,3)=IB3;
C=uint8(C);
subplot(224)
imshow(C)
% figure(1);
% subplot(6,4,[1,5]);imshow(P0);title('Original image');
% subplot(6,4,2);imshow(PR);title('R');subplot(6,4,3);imshow(PG);title('G');
% subplot(6,4,4);imshow(PB);title('B');subplot(6,4,6);imhist(PR);title('R');
% subplot(6,4,7);imhist(PG);title('G');subplot(6,4,8);imhist(PB);title('B');
% 
% subplot(6,4,[9,13]);imshow(O);title({'Image after bit-level';'row disorder'});
% subplot(6,4,10);imshow(OR);title('R');subplot(6,4,11);imshow(OG);title('G');
% subplot(6,4,12);imshow(OB);title('B');subplot(6,4,14);imhist(OR);title('R');
% subplot(6,4,15);imhist(OG);title('G');subplot(6,4,16);imhist(OB);title('B');
% 
% subplot(6,4,[17,21]);imshow(C);title({'Disrupted and';'DNA-encrypted ciphertext images'});
% subplot(6,4,18);imshow(C(:,:,1));title('R');subplot(6,4,19);imshow(C(:,:,2));title('G');
% subplot(6,4,20);imshow(C(:,:,3));title('B');subplot(6,4,22);imhist(C(:,:,1));title('R');
% subplot(6,4,23);imhist(C(:,:,2));title('G');subplot(6,4,24);imhist(C(:,:,3));title('B');

%imwrite(C,'./C/4.1.01.png');