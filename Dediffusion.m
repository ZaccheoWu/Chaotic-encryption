%% MATLAB R2022b data
%author: linyiting
%date: 2023/01/30
%Version: final version
%Other notes: None
function x=Dediffusion(I,key,xi)
I4=I;
I4 = double(I4);
[H,W,~]=size(I4);
C41=I4;
%读入中间密文
%key=hash_key(EI);
S_Len=H*W;              %序列长度，这里各个伪随机序列的长度一样，故统一用S_Len表示序列长度    
[S1,S2,S3,S4]=hyper_chaotic_system1(key,xi,S_Len);
R1=mod(floor(S1*(10^32-1)),255);
R2=mod(floor(S2*(10^32-1)),255);
R3=mod(floor(S3*(10^32-1)),255);
R4=mod(floor(S4*(10^32-1)),255);
R1=double(R1);
R2=double(R2);
R3=double(R3);
R4=double(R4);
R1=reshape(R1,H,W);
R2=reshape(R2,H,W);
R3=reshape(R3,H,W);
R4=reshape(R4,H,W);

for z=1:3
P41(:,W,z)=mod( C41(:,W,z)-C41(:,W-1,z)-R4(:,W),256 );
end    
for z=1:3   % W-th column
for i=W-1:-1:2     % i=W-1:-1:2,"-1" is necessary.   % (W-1)-th~2-nd column
    P41(:,i,z)=mod( C41(:,i,z)-C41(:,i-1,z)-P41(:,i+1,z)-R4(:,i),256 );
end
end

for z=1:3
P41(:,1,z)=mod( C41(:,1,z)-P41(:,W,z)-R4(:,1),256 );
end     % 1-st column
% 2-nd diffusion by each row
C31=P41;
for z=1:3
DE_CONFUSSION(H,:,z)=mod( C31(H,:,z)-C31(H-1,:,z)-R3(H,:),256 );
end   

% H-th row
for z=1:3
  for i=H-1:-1:2     % i=H-1:-1:2,"-1" is necessary.   (H-1)-th~2-nd column
      DE_CONFUSSION(i,:,z)=mod( C31(i,:,z)-C31(i-1,:,z)-DE_CONFUSSION(i+1,:,z)-R3(i,:),256 );
  end
end

for z=1:3
  DE_CONFUSSION(1,:,z)=mod( C31(1,:,z)-DE_CONFUSSION(H,:,z)-R3(1,:),256 );
end
%imwrite(uint8(DE_CONFUSSION),'./images/Test3.tiff');
% %-------------------二轮---------------------
R4=R2;
R3=R1;
C41=DE_CONFUSSION;
for z=1:3
P41(:,W,z)=mod( C41(:,W,z)-C41(:,W-1,z)-R4(:,W),256 );
end    
for z=1:3   % W-th column
for i=W-1:-1:2     % i=W-1:-1:2,"-1" is necessary.   % (W-1)-th~2-nd column
    P41(:,i,z)=mod( C41(:,i,z)-C41(:,i-1,z)-P41(:,i+1,z)-R4(:,i),256 );
end
end

for z=1:3
P41(:,1,z)=mod( C41(:,1,z)-P41(:,W,z)-R4(:,1),256 );
end     % 1-st column
% 2-nd diffusion by each row
C31=P41;
for z=1:3
DE_CONFUSSION(H,:,z)=mod( C31(H,:,z)-C31(H-1,:,z)-R3(H,:),256 );
end   

% H-th row
for z=1:3
  for i=H-1:-1:2     % i=H-1:-1:2,"-1" is necessary.   (H-1)-th~2-nd column
      DE_CONFUSSION(i,:,z)=mod( C31(i,:,z)-C31(i-1,:,z)-DE_CONFUSSION(i+1,:,z)-R3(i,:),256 );
  end
end

for z=1:3
  DE_CONFUSSION(1,:,z)=mod( C31(1,:,z)-DE_CONFUSSION(H,:,z)-R3(1,:),256 );
end
%imwrite(uint8(DE_CONFUSSION),'./images/Test4.tiff');
x=DE_CONFUSSION;
end