%% MATLAB R2022b data
%author: linyiting
%date: 2023/01/30
%Version: final version
%Other notes: None
function x=dediffusion0(I,C)
hh=hash(C,"MD5");
sum=0;
[h,w,~]=size(I);
H=h;W=w;
for i=1:4
    sum=hh(4.*i)+sum;
end
a1=mod(sum,100);
sum=0;
for i=1:4
    sum=hh(4.*i-1)+sum;
end
b1=mod(sum,100);
sum=0;
for i=1:4
    sum=hh(4.*i-2)+sum;
end
a2=mod(sum,100);
sum=0;
for i=1:4
    sum=hh(4.*i-3)+sum;
end
b2=mod(sum,100);
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
C41=double(P1);
P41(:,W)=mod( C41(:,W)-C41(:,W-1)-R4(:,W),256 );   
  % W-th column
for i=W-1:-1:2     % i=W-1:-1:2,"-1" is necessary.   % (W-1)-th~2-nd column
    P41(:,i)=mod( C41(:,i)-C41(:,i-1)-P41(:,i+1)-R4(:,i),256 );
end


P41(:,1)=mod( C41(:,1)-P41(:,W)-R4(:,1),256 );     % 1-st column
% 2-nd diffusion by each row
C31=P41;

DE_CONFUSSION(H,:)=mod( C31(H,:)-C31(H-1,:)-R3(H,:),256 );
% H-th row
  for i=H-1:-1:2     % i=H-1:-1:2,"-1" is necessary.   (H-1)-th~2-nd column
      DE_CONFUSSION(i,:)=mod( C31(i,:)-C31(i-1,:)-DE_CONFUSSION(i+1,:)-R3(i,:),256 );
  end

  DE_CONFUSSION(1,:)=mod( C31(1,:)-DE_CONFUSSION(H,:)-R3(1,:),256 );
%imwrite(uint8(DE_CONFUSSION),'./images/Test3.tiff');
% %-------------------二轮---------------------
R4=R2;
R3=R1;
C41=DE_CONFUSSION;
P41(:,W)=mod( C41(:,W)-C41(:,W-1)-R4(:,W),256 );
   
  % W-th column
for i=W-1:-1:2     % i=W-1:-1:2,"-1" is necessary.   % (W-1)-th~2-nd column
    P41(:,i)=mod( C41(:,i)-C41(:,i-1)-P41(:,i+1)-R4(:,i),256 );
end
P41(:,1)=mod( C41(:,1)-P41(:,W)-R4(:,1),256 );
   % 1-st column
% 2-nd diffusion by each row
C31=P41;
DE_CONFUSSION(H,:)=mod( C31(H,:)-C31(H-1,:)-R3(H,:),256 ); 

% H-th row
  for i=H-1:-1:2     % i=H-1:-1:2,"-1" is necessary.   (H-1)-th~2-nd column
      DE_CONFUSSION(i,:)=mod( C31(i,:)-C31(i-1,:)-DE_CONFUSSION(i+1,:)-R3(i,:),256 );
  end


  DE_CONFUSSION(1,:)=mod( C31(1,:)-DE_CONFUSSION(H,:)-R3(1,:),256 );

%imwrite(uint8(DE_CONFUSSION),'./images/Test4.tiff');
x=DE_CONFUSSION;
end