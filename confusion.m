function OR2 = confusion(PR,s1)
[height,width]=size(PR);
XR1=s1(1,1:width);
YR1=s1(1,height+1:height+width*8);
[sXR1,indexX] = sort(XR1); 
[sYR1,indexY] = sort(YR1);
PR1=dec2bin(PR);
PR2=reshape(PR1,height,width*8);
outputP=PR2;
for i=1:height
    for j=1:width*8
      t1=outputP(i,j);
      outputP(i,j)=outputP(indexX(i),indexY(j));
      outputP(indexX(i),indexY(j))=t1;
    end
end
ORbin=outputP;
ORbin=reshape(ORbin,height*width,8);
OR1=bin2dec(ORbin);
OR2=reshape(OR1,height,width);
end

