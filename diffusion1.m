%% MATLAB R2022b data
%author: linyiting
%date: 2023/01/30
%Version: final version
%Other notes: None
% function x=diffusion(I,EI)
function x=diffusion1(I)
[H,W,~]=size(I);
% key=hash_key(EI);
S_Len=H*W;
h=H;
w=W;
% [S1,S2,S3,S4]=hyper_chaotic_system(key,S_Len);
%%
a1 = 32;
b1 = 25;
x1(1) = 0.1;
y1(1) = 0.1;
r = 2000;%舍弃次数
for i=2:r+(h*w)
     x1(i)=sin((a1.*pi.^2)./(x1(i-1).*y1(i-1)));
     y1(i)=sin(b1.*pi.^2.*x1(i-1).*(1-y1(i-1))); 
end
% s1=mod(floor(x1(1,r+1:r+(h*w)).*10^15),256);
% s2=mod(floor(y1(1,r+1:r+(h*w)).*10^15),256);
x1=x1(1,r+1:r+(h*w));
y1=y1(1,r+1:r+(h*w));
%%
a2 = 64;
b2 = 50;
x2(1) = 0.1;
y2(1) = 0.1;
r = 2000;%舍弃次数
for i=2:r+(h*w)
     x2(i)=sin((a2.*pi.^2)./(x2(i-1).*y2(i-1)));
     y2(i)=sin(b2.*pi.^2.*x2(i-1).*(1-y2(i-1))); 
end
% s3=mod(floor(x2(1,r+1:r+(h*w)).*10^15),256);
% s4=mod(floor(y2(1,r+1:r+(h*w)).*10^15),256);
x2=x2(1,r+1:r+(h*w));
y2=y2(1,r+1:r+(h*w));
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
for z=1:3
  for w1=1:W
      C11(1,w1,z)=mod( P1(1,w1,z)+P1(H,w1,z)+R1(1,w1),256 );
  end              % 1-st row
end


for z=1:3
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1,z)=mod( C11(i-1,w1,z)+P1(i,w1,z)+P1(i+1,w1,z)+R1(i,w1),256 );
      end
  end
end


for z=1:3
  for w1=1:W
      C11(H,w1,z)=mod( C11(H-1,w1,z)+P1(H,w1,z)+R1(H,w1),256 );     % H-th row
  end
end


 % 列加密
P21=C11;
for z=1:3
  C21(:,1,z)=mod( P21(:,1,z)+P21(:,W,z)+R2(:,1),256 );     % 1-st column
end

for z=1:3
  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i,z)=mod( C21(:,i-1,z)+P21(:,i,z)+P21(:,i+1,z)+R2(:,i),256 );
  end
end

for z=1:3
  C21(:,W,z)=mod( C21(:,W-1,z)+P21(:,W,z)+R2(:,W),256 ); 
end
% imwrite(uint8(C21),'./images/Test1.tiff');
%-------------------二轮---------------------
P1=double(C21);
% 行加密
for z=1:3
  for w1=1:W
      C11(1,w1,z)=mod( P1(1,w1,z)+P1(H,w1,z)+R3(1,w1),256 );
  end              % 1-st row
end


for z=1:3
  for i=2:H-1     % 2-nd~(H-1)-th row
      for w1=1:W
       C11(i,w1,z)=mod( C11(i-1,w1,z)+P1(i,w1,z)+P1(i+1,w1,z)+R3(i,w1),256 );
      end
  end
end


for z=1:3
  for w1=1:W
      C11(H,w1,z)=mod( C11(H-1,w1,z)+P1(H,w1,z)+R3(H,w1),256 );     % H-th row
  end
end


 % 列加密
P21=C11;
for z=1:3
  C21(:,1,z)=mod( P21(:,1,z)+P21(:,W,z)+R4(:,1),256 );     % 1-st column
end

for z=1:3
  for i=2:W-1     % 2-nd~(W-1)-th column
      C21(:,i,z)=mod( C21(:,i-1,z)+P21(:,i,z)+P21(:,i+1,z)+R4(:,i),256 );
  end
end

for z=1:3
  C21(:,W,z)=mod( C21(:,W-1,z)+P21(:,W,z)+R4(:,W),256 ); 
end

DIFFUSION_CIPHER=C21;
% imwrite(uint8(DIFFUSION_CIPHER),'./images/Test2.tiff');
x=DIFFUSION_CIPHER;
end
