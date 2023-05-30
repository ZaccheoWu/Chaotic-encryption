function OR2 = deconfusion0(PR,s1)
[height,width]=size(PR);
XR1=s1(1,1:width);
YR1=s1(1,height+1:height+width*8);
[sXR1,indexX] = sort(XR1); 
[sYR1,indexY] = sort(YR1);
PR1=dec2bin(PR);
PR2=reshape(PR1,height,width*8);
inputP=PR2;
for i=height:-1:1
    for j=width*8:-1:1
        t1=inputP(i,j);
        inputP(i,j)=inputP(indexX(i),indexY(j));
        inputP(indexX(i),indexY(j))=t1;
    end
end
ORbin=inputP;
ORbin=reshape(ORbin,height*width,8);
OR1=bin2dec(ORbin);
OR2=reshape(OR1,height,width);
end