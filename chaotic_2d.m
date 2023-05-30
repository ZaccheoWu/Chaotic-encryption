function [s1,s2,s3,s4,s5] = chaotic_2d(P)
[h,w,~]=size(P);
hh=hash(P,"MD5");
key1=0;
for i=0:7
    key1=hh(4.*i+1)+key1;
end
a2=mod(key1,100);

key2=0;
for i=0:7
    key2=hh(4.*i+2)+key2;
end
b2=mod(key2,100);

x(1)=0;
for i=0:7
    x(1)=hh(4.*i+3)+x(1);
end
x2(1)=0.1+x(1)/10000;

y(1)=0;
for i=0:7
    y(1)=hh(4.*i+4)+y(1);
end
y2(1)=0.1+y(1)/10000;
r = 2000;%舍弃次数
for i=2:r+(40*h*w)
     x2(i)=sin((a2.*pi.^2)./(x2(i-1).*y2(i-1)));
     y2(i)=sin(b2.*pi.^2.*x2(i-1).*(1-y2(i-1))); 
end
s1=x2(1,r+1:r+(8*w+h));
s2=x2(1,r+1+(8*w+h):r+(h*w*10));
s3=y2(1,r+1:r+(8*w*h));
s4=y2(1,r+1+(8*w*h):r+(h*w*16));
s5=y2(1,r+1+(h*w*16):r+(40*h*w));
end