%% MATLAB R2022b data
%author: linyiting
%date: 2023/5/23
%Version: final version
%Other notes: None
% function x=diffusion(I,EI)
function x=diffusion0(I,s5)
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
end