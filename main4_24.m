clear ;clc;close all;
%% 明文处理
P0=imread('./misc/4.2.03.tiff');
[h,w,~] = size(P0);
% w=w/3;
PR = P0(:,:,1);PG = P0(:,:,2);PB = P0(:,:,3);

%% R通道
% 序列生成
[s1,s2,s3,s4,s5]=chaotic_2d(P0);
% 置换
CR1 = confusion(PR,s1);
% RNAcoding
CR2=RNAcoding(CR1,s2,s3,s4);
%置乱
%CR3=diffusion0(CR2,s5);
I=CR2;
[H,W]=size(I);
% key=hash_key(EI);
% [S1,S2,S3,S4]=hyper_chaotic_system(key,S_Len);
%%
x1=s5(1,1:H*W);
x2=s5(1,H*W+1:2*H*W);
y1=s5(1,2*H*W+1:3*H*W);
y2=s5(1,3*H*W+1:4*H*W);

%%
R1=mod(floor(x1*(10^32-1)),255);
R2=mod(floor(x2*(10^32-1)),255);
R3=mod(floor(y1*(10^32-1)),255);
R4=mod(floor(y2*(10^32-1)),255);
R1=double(R1);
R2=double(R2);
R3=double(R3);
R4=double(R4);
R1=reshape(R1,H,W);
R2=reshape(R2,H,W);
R3=reshape(R3,H,W);
R4=reshape(R4,H,W);
P1=I;
P1=double(P1);
% [H,W,~]=size(P1);
% 行加密
  for w1=1:W
      C11(1,w1)=mod(P1(1,w1)+P1(H,w1)+R1(1,w1),256 );
  end              % 1-st row
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1)=mod( C11(i-1,w1)+P1(i,w1)+P1(i+1,w1)+R1(i,w1),256 );
      end
  end
  for w1=1:W
      C11(H,w1)=mod( C11(H-1,w1)+P1(H,w1)+R1(H,w1),256 );     % H-th row
  end
 % 列加密
P21=C11;

  C21(:,1)=mod( P21(:,1)+P21(:,W)+R2(:,1),256 );     % 1-st column

  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i)=mod( C21(:,i-1)+P21(:,i)+P21(:,i+1)+R2(:,i),256 );
  end

  C21(:,W)=mod( C21(:,W-1)+P21(:,W)+R2(:,W),256 ); 

% imwrite(uint8(C21),'./images/Test1.tiff');
%-------------------二轮---------------------
P1=double(C21);
% 行加密
  for w1=1:W
      C11(1,w1)=mod( P1(1,w1)+P1(H,w1)+R3(1,w1),256 );
  end              % 1-st row
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1)=mod( C11(i-1,w1)+P1(i,w1)+P1(i+1,w1)+R3(i,w1),256 );
      end
  end
  for w1=1:W
      C11(H,w1)=mod( C11(H-1,w1)+P1(H,w1)+R3(H,w1),256 );     % H-th row
  end
 % 列加密
P21=C11;
  C21(:,1)=mod( P21(:,1)+P21(:,W)+R4(:,1),256 );     % 1-st column

  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i)=mod( C21(:,i-1)+P21(:,i)+P21(:,i+1)+R4(:,i),256 );
  end
  C21(:,W)=mod( C21(:,W-1)+P21(:,W)+R4(:,W),256 ); 
DIFFUSION_CIPHER=C21;
% imwrite(uint8(DIFFUSION_CIPHER),'./images/Test2.tiff');
x=DIFFUSION_CIPHER;
CR3=x;
%% G通道
% 序列生成
[s1,s2,s3,s4,s5]=chaotic_2d(CR3);
% 置换
CG1 = confusion(PG,s1);
% RNAcoding
CG2=RNAcoding(CG1,s2,s3,s4);
%置乱
%CG3=diffusion0(CG2,P0);
I=CG2;
[H,W]=size(I);
% key=hash_key(EI);
% [S1,S2,S3,S4]=hyper_chaotic_system(key,S_Len);
%%
x1=s5(1,1:H*W);
x2=s5(1,H*W+1:2*H*W);
y1=s5(1,2*H*W+1:3*H*W);
y2=s5(1,3*H*W+1:4*H*W);

%%
R1=mod(floor(x1*(10^32-1)),255);
R2=mod(floor(x2*(10^32-1)),255);
R3=mod(floor(y1*(10^32-1)),255);
R4=mod(floor(y2*(10^32-1)),255);
R1=double(R1);
R2=double(R2);
R3=double(R3);
R4=double(R4);
R1=reshape(R1,H,W);
R2=reshape(R2,H,W);
R3=reshape(R3,H,W);
R4=reshape(R4,H,W);
P1=I;
P1=double(P1);
% [H,W,~]=size(P1);
% 行加密
  for w1=1:W
      C11(1,w1)=mod(P1(1,w1)+P1(H,w1)+R1(1,w1),256 );
  end              % 1-st row
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1)=mod( C11(i-1,w1)+P1(i,w1)+P1(i+1,w1)+R1(i,w1),256 );
      end
  end
  for w1=1:W
      C11(H,w1)=mod( C11(H-1,w1)+P1(H,w1)+R1(H,w1),256 );     % H-th row
  end
 % 列加密
P21=C11;

  C21(:,1)=mod( P21(:,1)+P21(:,W)+R2(:,1),256 );     % 1-st column

  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i)=mod( C21(:,i-1)+P21(:,i)+P21(:,i+1)+R2(:,i),256 );
  end

  C21(:,W)=mod( C21(:,W-1)+P21(:,W)+R2(:,W),256 ); 

% imwrite(uint8(C21),'./images/Test1.tiff');
%-------------------二轮---------------------
P1=double(C21);
% 行加密
  for w1=1:W
      C11(1,w1)=mod( P1(1,w1)+P1(H,w1)+R3(1,w1),256 );
  end              % 1-st row
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1)=mod( C11(i-1,w1)+P1(i,w1)+P1(i+1,w1)+R3(i,w1),256 );
      end
  end
  for w1=1:W
      C11(H,w1)=mod( C11(H-1,w1)+P1(H,w1)+R3(H,w1),256 );     % H-th row
  end
 % 列加密
P21=C11;
  C21(:,1)=mod( P21(:,1)+P21(:,W)+R4(:,1),256 );     % 1-st column

  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i)=mod( C21(:,i-1)+P21(:,i)+P21(:,i+1)+R4(:,i),256 );
  end
  C21(:,W)=mod( C21(:,W-1)+P21(:,W)+R4(:,W),256 ); 
DIFFUSION_CIPHER=C21;
% imwrite(uint8(DIFFUSION_CIPHER),'./images/Test2.tiff');
x=DIFFUSION_CIPHER;
CG3=x;
%% B通道
% 序列生成
[s1,s2,s3,s4,s5]=chaotic_2d(CG3);
% 置换
CB1 = confusion(PB,s1);
% RNAcoding
CB2=RNAcoding(CB1,s2,s3,s4);
%置乱
%CB3=diffusion0(CB2,P0);
I=CB2;
[H,W]=size(I);
% key=hash_key(EI);
% [S1,S2,S3,S4]=hyper_chaotic_system(key,S_Len);
%%
x1=s5(1,1:H*W);
x2=s5(1,H*W+1:2*H*W);
y1=s5(1,2*H*W+1:3*H*W);
y2=s5(1,3*H*W+1:4*H*W);

%%
R1=mod(floor(x1*(10^32-1)),255);
R2=mod(floor(x2*(10^32-1)),255);
R3=mod(floor(y1*(10^32-1)),255);
R4=mod(floor(y2*(10^32-1)),255);
R1=double(R1);
R2=double(R2);
R3=double(R3);
R4=double(R4);
R1=reshape(R1,H,W);
R2=reshape(R2,H,W);
R3=reshape(R3,H,W);
R4=reshape(R4,H,W);
P1=I;
P1=double(P1);
% [H,W,~]=size(P1);
% 行加密
  for w1=1:W
      C11(1,w1)=mod(P1(1,w1)+P1(H,w1)+R1(1,w1),256 );
  end              % 1-st row
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1)=mod( C11(i-1,w1)+P1(i,w1)+P1(i+1,w1)+R1(i,w1),256 );
      end
  end
  for w1=1:W
      C11(H,w1)=mod( C11(H-1,w1)+P1(H,w1)+R1(H,w1),256 );     % H-th row
  end
 % 列加密
P21=C11;

  C21(:,1)=mod( P21(:,1)+P21(:,W)+R2(:,1),256 );     % 1-st column

  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i)=mod( C21(:,i-1)+P21(:,i)+P21(:,i+1)+R2(:,i),256 );
  end

  C21(:,W)=mod( C21(:,W-1)+P21(:,W)+R2(:,W),256 ); 

% imwrite(uint8(C21),'./images/Test1.tiff');
%-------------------二轮---------------------
P1=double(C21);
% 行加密
  for w1=1:W
      C11(1,w1)=mod( P1(1,w1)+P1(H,w1)+R3(1,w1),256 );
  end              % 1-st row
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1)=mod( C11(i-1,w1)+P1(i,w1)+P1(i+1,w1)+R3(i,w1),256 );
      end
  end
  for w1=1:W
      C11(H,w1)=mod( C11(H-1,w1)+P1(H,w1)+R3(H,w1),256 );     % H-th row
  end
 % 列加密
P21=C11;
  C21(:,1)=mod( P21(:,1)+P21(:,W)+R4(:,1),256 );     % 1-st column

  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i)=mod( C21(:,i-1)+P21(:,i)+P21(:,i+1)+R4(:,i),256 );
  end
  C21(:,W)=mod( C21(:,W-1)+P21(:,W)+R4(:,W),256 ); 
DIFFUSION_CIPHER=C21;
% imwrite(uint8(DIFFUSION_CIPHER),'./images/Test2.tiff');
x=DIFFUSION_CIPHER;
CB3=x;
%% 图像
OR=uint8(CR1);OG=uint8(CG1);OB=uint8(CB1);
O(:,:,1)=OR;O(:,:,2)=OG;O(:,:,3)=OB;
C(:,:,1)=CR3;C(:,:,2)=CG3;C(:,:,3)=CB3;
C=uint8(C);

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

imwrite(C,'./C/4.2.03.png');