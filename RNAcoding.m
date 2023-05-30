function CR = RNAcoding(P,s2,s3,s4)

[h,w]=size(P);
ss2=s2(1,1:h*w);
encode=mod(floor(mod(((abs(ss2)-floor(abs(ss2)))*10^15),10^8)),8)+1;
s2k=s2(1,h*w+1:2*h*w);
s2kk=mod(floor(mod(((abs(s2k)-floor(abs(s2k)))*10^15),10^8)),256);
os=s3(1,1:4*h*w);%运算控制序列
os1=mod(floor(mod(((abs(os)-floor(abs(os)))*10^15),10^8)),6)+1;
decode=s4(1,1:h*w);
decode1=mod(floor(mod(((abs(decode)-floor(abs(decode)))*10^15),10^8)),8)+1;
% ss3=s3(1,1:h*w);
% ss2=s2(1,1:4*h*w);
% ss4=s4(1,1:h*w);
% sss3=mod(floor(mod(((abs(ss3)-floor(abs(ss3)))*10^15),10^8)),6);
% sss4=mod(floor(mod(((abs(ss4)-floor(abs(ss4)))*10^15),10^8)),6)+1;
% sss21=mod(floor(mod(((abs(ss2)-floor(abs(ss2)))*10^15),10^8),8))+1;
% sss22=mod(floor(mod(((abs(ss2)-floor(abs(ss2)))*10^15),10^8)),256);

%sss2=y2(1,r+1:r+(4*h*w));

%s4=mod(floor(mod(((abs(sss2)-floor(abs(sss2)))*10^15),10^8)),6)+1;
%% 对P编码
% encode1=mod(floor(mod(((abs(sss21)-floor(abs(sss21)))*10^15),10^8)),8)+1;
encode1=reshape(encode,h,w);
RNA_OR=RNA_Dyn_Encode(P,encode1);
%% 构造密钥矩阵
%encode2=mod(floor(mod(((abs(s2)-floor(abs(s2)))*10^15),10^8)),8)+1;
ss2=reshape(s2kk,h,w);
RNA_KR=RNA_Dyn_Encode(ss2,encode1);
%% RNA运算
m=h;n=4*w;
Id=RNA_OR;Kd=RNA_KR;
ss4=uint8(os1);
ss4=reshape(ss4,m,n);
for i=1:m
    for j=1:n
        switch ss4(i,j)
    case 0
        Cd(i,j)=RNA_add(Id(i,j),Kd(i,j));
    case 1
        Cd(i,j)=RNA_sub(Id(i,j),Kd(i,j));
    case 2
        Cd(i,j)=RNA_comp_add(Id(i,j),Kd(i,j));
    case 3
        Cd(i,j)=RNA_comp_sub(Id(i,j),Kd(i,j));
    case 4
        Cd(i,j)=RNA_xor(Id(i,j),Kd(i,j));
    case 5
        Cd(i,j)=RNA_xnor(Id(i,j),Kd(i,j));
    end
    end
end
RNA_OR=Cd;
%% 解码
decode2=reshape(decode1,h,w);
CR=uint8(RNA_Dyn_Decode(RNA_OR,decode2));
end