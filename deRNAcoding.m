function CR = deRNAcoding(P,s1,s2)

[h,w]=size(P);
s3=mod(floor(mod(((abs(s1)-floor(abs(s1)))*10^15),10^8)),256);
s4=mod(floor(mod(((abs(s2)-floor(abs(s2)))*10^15),10^8)),6)+1;
a2=32;
b2=64;
x2(1) = 0.1;
y2(1) = 0.1;
r = 2000;%舍弃次数
for i=2:r+(4*h*w)
     x2(i)=sin((a2.*pi.^2)./(x2(i-1).*y2(i-1)));
     y2(i)=sin(b2.*pi.^2.*x2(i-1).*(1-y2(i-1))); 
end
sss2=y2(1,r+1:r+(4*h*w));

s4=mod(floor(mod(((abs(sss2)-floor(abs(sss2)))*10^15),10^8)),6)+1;
%% 对P逆解码
encode1=mod(floor(mod(((abs(s1)-floor(abs(s1)))*10^15),10^8)),8)+1;
encode1=reshape(encode1,h,w);
RNA_OR=RNA_Dyn_Encode(P,encode1);
%% s1进行编码
encode2=mod(floor(mod(((abs(s2)-floor(abs(s2)))*10^15),10^8)),8)+1;
ss3=reshape(s3,h,w);
encode2=reshape(encode2,h,w);
RNA_KR=RNA_Dyn_Encode(ss3,encode2);
%%运算
m=h;n=4*w;
Id=RNA_OR;Kd=RNA_KR;
s4=uint8(s4);
s4=reshape(s4,m,n);
for i=1:m
    for j=1:n
        switch s4(i,j)
    case 1
        Cd(i,j)=deRNA_add(Id(i,j),Kd(i,j));
    case 2
        Cd(i,j)=deRNA_sub(Id(i,j),Kd(i,j));
    case 3
        Cd(i,j)=deRNA_comp_add(Id(i,j),Kd(i,j));
    case 4
        Cd(i,j)=deRNA_comp_sub(Id(i,j),Kd(i,j));
    case 5
        Cd(i,j)=deRNA_xor(Id(i,j),Kd(i,j));
    case 6
        Cd(i,j)=deRNA_xnor(Id(i,j),Kd(i,j));
    end
    end
end
RNA_OR=Cd;
CR=uint8(RNA_Dyn_Decode(RNA_OR,encode1));
end