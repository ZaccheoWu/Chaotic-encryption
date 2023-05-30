% 程序描述：DNA动态解码
% DNA编码和解码方式采用论文：2017-Chinese Physics B-
% A novel color image encryption scheme using fractional-order hyperchaotic system and DNA sequence operations.pdf
% by whp 2018.4.2-OK
function B=RNA_Dyn_Decode(array,num)
[m,n]=size(array);
for i=1:m
    for j=1:n
        if j/8==fix(j/8) 
            switch num(i,j/8)
                case 1       
                    for j1=j-7:j
                        if     array(i,j1)=='A' A(i,j1)=0;
                        elseif array(i,j1)=='C' A(i,j1)=1;
                        elseif array(i,j1)=='G' A(i,j1)=2;
                        elseif array(i,j1)=='U' A(i,j1)=3;      
                        end
                    end
                case 2       
                    for j1=j-7:j
                        if     array(i,j1)=='A' A(i,j1)=0;                             
                        elseif array(i,j1)=='G' A(i,j1)=1;
                        elseif array(i,j1)=='C' A(i,j1)=2;
                        elseif array(i,j1)=='U' A(i,j1)=3;         
                        end
                    end   
                case 3       
                    for j1=j-7:j
                        if     array(i,j1)=='U' A(i,j1)=0;                             
                        elseif array(i,j1)=='C' A(i,j1)=1;
                        elseif array(i,j1)=='G' A(i,j1)=2;
                        elseif array(i,j1)=='A' A(i,j1)=3;         
                        end
                    end
                case 4       
                    for j1=j-7:j
                        if     array(i,j1)=='U' A(i,j1)=0;                             
                        elseif array(i,j1)=='G' A(i,j1)=1;
                        elseif array(i,j1)=='C' A(i,j1)=2;
                        elseif array(i,j1)=='A' A(i,j1)=3;        
                        end
                    end  
                case 5       
                    for j1=j-7:j
                        if     array(i,j1)=='G' A(i,j1)=0;                             
                        elseif array(i,j1)=='U' A(i,j1)=1;
                        elseif array(i,j1)=='A' A(i,j1)=2;
                        elseif array(i,j1)=='C' A(i,j1)=3;       
                        end
                    end
                case 6       
                    for j1=j-7:j
                        if     array(i,j1)=='G' A(i,j1)=0;                             
                        elseif array(i,j1)=='A' A(i,j1)=1;
                        elseif array(i,j1)=='U' A(i,j1)=2;
                        elseif array(i,j1)=='C' A(i,j1)=3;        
                        end
                    end   
                case 7       
                    for j1=j-7:j
                        if     array(i,j1)=='C' A(i,j1)=0;                             
                        elseif array(i,j1)=='U' A(i,j1)=1;
                        elseif array(i,j1)=='A' A(i,j1)=2;
                        elseif array(i,j1)=='G' A(i,j1)=3;       
                        end
                    end
                case 8       
                    for j1=j-7:j
                        if     array(i,j1)=='C' A(i,j1)=0;                             
                        elseif array(i,j1)=='A' A(i,j1)=1;
                        elseif array(i,j1)=='U' A(i,j1)=2;
                        elseif array(i,j1)=='G' A(i,j1)=3;         
                        end
                    end                     
            end
        end
    end
end

for i=1:m
    for j=1:n/4
        B(i,j)=A(i,4*(j-1)+1)*64+A(i,4*(j-1)+2)*16+A(i,4*(j-1)+3)*4+A(i,4*(j-1)+4);
    end
end
end