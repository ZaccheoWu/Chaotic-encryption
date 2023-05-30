%% NPCR UACI BACI
clear;clc;close all;
% PR=imread('./misc/4.1.02.tiff');  %读入明文
PR=imread('./misc/4.2.03.tiff'); 
C1R=imread('./C/4.2.03.png');  %读入密文或解密文
PRR=PR(:,:,1);
C1RR=C1R(:,:,1); %R

PRR2=PR(:,:,2);
C2RR=C1R(:,:,2); %G

PRR3=PR(:,:,3);
C3RR=C1R(:,:,3); %B

diffIR=NPCR_UACI_BACI(PRR,C1RR) %R
diffIG=NPCR_UACI_BACI(PRR2,C2RR) %G
diffIB=NPCR_UACI_BACI(PRR3,C3RR) %B


%% 计算两幅图像（明文和密文）的差别：MSE和PSNR
% clear;clc;close all;
% A1=imread('./pho3/4.2.05解密key2.tiff');  %读取原文图像
% A1=A1(:,:,1);
% B1=imread('./pho4/4.2.05解密key12.tiff');  %读取密文图像
% B1=B1(:,:,1);
% [r,c]=size(A1);
% mse_m=double(zeros(r,c));
% for i=1:r
% for j=1:c
% mse_m(i,j)=(A1(i,j)-B1(i,j))^2;
% end
% end
% mse=sum(mse_m(:))/(r*c)
% psnr=10*log10(double(255*255/mse))


%% 图像相关性分析：相关系数计算、水平、垂直及对角线相关性分析 相关系数correlation coefficient2
% clear;clc;close all;
% rgb_I=imread('./pho/4.1.05.tiff');    
% rgb_C=CN;
% 
% rI=Image_Correlation_Coefficient(I,3000)
% rC=Image_Correlation_Coefficient(C,3000)
% % 明文和密文RGB三分量的相邻像素相关性分析
% 
%  IR = rgb_I(:,:,1);
%  CR = rgb_C(:,:,1);
% 
% %明文相邻像素相关性分析图
% figure(1)
% rIR=Image_Correlation_Coefficient(IR,3000)

% % 密文相邻像素相关性分析图
% % 第一次请注释掉，否则会覆盖明文的
% figure(2)
% rCR=Image_Correlation_Coefficient(CR,3000)
% out='OK'


%% 彩色直方图
% clear;close all;clc;
% I=imread('./pho/2.1.09彩色密文.tiff');
% Iread=I  %这里是你要跑的图的入口
% % subplot(1,4,1); imshow(uint8(Iread));
% % subplot(1,4,2);
% subplot(1,2,1); imshow(uint8(Iread));
% subplot(1,2,2);
% IR = Iread(:,:,1);
% IG = Iread(:,:,2);
% IB = Iread(:,:,3);

% 色块图
% histogram(IR,50,'Facecolor','r','FaceAlpha',1,'Edgecolor','none');
% hold on
% histogram(IG,50,'Facecolor','g','FaceAlpha',1,'Edgecolor','none');
% hold on
% histogram(IB,50,'Facecolor','b','FaceAlpha',1,'Edgecolor','none');
% box off;

% 柱状图
% histogram(IR,50,'Facecolor',[0.6350 0.0780 0.1840]);
% hold on
% histogram(IG,50,'Facecolor',[0.2400 0.5300 0.0900]);
% hold on
% histogram(IB,50,'Facecolor',[0.2000 0.5000 0.9510])
% box off;

% 条状图
% histogram(IR,512,'Facecolor','r','FaceAlpha',1,'Edgecolor','none');
% hold on
% histogram(IG,512,'Facecolor','g','FaceAlpha',1,'Edgecolor','none');
% hold on
% histogram(IB,512,'Facecolor','b','FaceAlpha',1,'Edgecolor','none');
% box off;
% 
% set(gca,'XTick',0:50:255);
% set(gca,'YTick',0:50:350);%调整坐标轴数值
% set(gca,'FontSize',14);%调整字体大小
% xlim([0 255])
% ylim([0 350])%坐标轴参数更改
% axis square;
% xlabel('Pixel value');ylabel('Frequency');


%% 灰度直方图
% clear;clc;close all;
% I=imread('./pho/4.1.06_R.tiff');
% Iread=I;  %这里是你要跑的图的入口
% subplot(1,2,1); imshow(uint8(Iread));
% subplot(1,2,2);
% % histogram(Iread,512,'FaceAlpha',1,'Edgecolor','none');
% histogram(Iread);
% set(gca,'XTick',0:50:255);
% set(gca,'YTick',0:200:800);
% set(gca,'FontSize',14);%调整坐标轴数值字体大小
% xlim([0 255])
% ylim([0 800])%改这里就可以了
% axis square;
% xlabel('Pixel value');ylabel('Frequency');

% subplot(1,4,3); imshow(uint8(I));
% subplot(1,4,4);
% histogram(I);
% % histogram(I,512,'FaceAlpha',1,'Edgecolor','none');
% set(gca,'XTick',0:50:255);
% set(gca,'YTick',0:200:800);
% set(gca,'FontSize',14);%调整坐标轴数值字体大小
% xlim([0 255])
% ylim([0 800])%改这里就可以了
% axis square;
% xlabel('Pixel value');ylabel('Frequency');


%% RGB三通道分解图
% I=imread('./pho/4.2.07彩色密文_all.tiff');
% P=I;
% CR = P(:,:,1);
% CG = P(:,:,2);
% CB = P(:,:,3);

% figure(1)
% imshow(CR);
% figure(2)
% imshow(CG);
% figure(3)
% imshow(CB);

% imwrite(uint8(CR),'./pho/4.2.07_R.tiff');
% imwrite(uint8(CG),'./pho/4.2.07_G.tiff');
% imwrite(uint8(CB),'./pho/4.2.07_B.tiff');


%% 3D彩色直方图
% clc;clear;close all;
% rgb_I=imread('./misc/4.2.07.tiff');  %明文
% rgb_C=imread('./pho/4.2.07彩色密文.tiff');  %密文

%  IR = rgb_I(:,:,1);  %明文RGB
%  IG = rgb_I(:,:,2);
%  IB = rgb_I(:,:,3);

%  CR = rgb_C(:,:,1);  %密文RGB
%  CG = rgb_C(:,:,2);
%  CB = rgb_C(:,:,3);
 
% rIR=Image_Correlation_Coefficient3(IR,IG, IB ,6000)  %明文
% cIR=Image_Correlation_Coefficient3(CR,CG, CB ,6000)  %密文


%% SSIM test
% clear;clc;close all; 
% 
% A= imread('./misc/4.1.02.tiff');
% ref = imread('./pho2/4.1.02解密0.tiff'); 
% A1=A(:,:,1); %三个维度求平均值
% ref1=ref(:,:,1); %三个维度求平均值
% [ssimval,ssimmap] = ssim(A1,ref1);
% SSIM1=ssimval;
% 
% A2=A(:,:,1); %三个维度求平均值
% ref2=ref(:,:,1); %三个维度求平均值
% [ssimval,ssimmap] = ssim(A2,ref2);
% SSIM2=ssimval;
% 
% A3=A(:,:,1); %三个维度求平均值
% ref3=ref(:,:,1); %三个维度求平均值
% [ssimval,ssimmap] = ssim(A3,ref3);
% SSIM3=ssimval;
% 
% SSIMOUT=SSIM1+SSIM2+SSIM3;
% SSIMOUT=SSIMOUT/3


%% ENTROPY test
% clc;clear;close all;

% I=imread('./aerials/2.2.04.tiff');  % 明文入口
% C=imread('./images/最终彩色密文_all.tiff');  % 密文或解密文入口
% 明文信息熵
% HI=ENTROPY(I)
% 密文或解密文信息熵
% HC=ENTROPY(C)