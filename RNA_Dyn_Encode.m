% 程序描述：RNA动态编码
% 1、修正原来程序只能处理正方形图像，输入尺寸为H*W，输出尺寸为H*(4W)
% 2、修正为按照像素逐个DNA编码方式
% by whp 2018.4.2-OK
%% 子函数 RNA动态编码
function fv=RNA_Dyn_Encode(array,num)
[H,W]=size(array);
for i=1:H
    for j=1:W
        A(i,4*(j-1)+1)=bitand(array(i,j),192)/64;
        A(i,4*(j-1)+2)=bitand(array(i,j),48)/16;
        A(i,4*(j-1)+3)=bitand(array(i,j),12)/4;
        A(i,4*(j-1)+4)=bitand(array(i,j),3);
        if j/2==fix(j/2) 
% %             disp('OK');
            switch num(i,j/2)
                case 1
%                     disp('1');
%          j1=(j-2)*4+1:(j-2)*4+8 ，推理过程：RNA序列长度是RGB的4倍             
                    for j1=(j-2)*4+1:(j-2)*4+8                    
                        if A(i,j1)==0     fv(i,j1)='A';           
                        elseif A(i,j1)==1 fv(i,j1)='C';            
                        elseif A(i,j1)==2 fv(i,j1)='G';            
                        else              fv(i,j1)='U';            
                        end
                    end
                case 2
%                     disp('2');
                    for j1=(j-2)*4+1:(j-2)*4+8                   
                        if A(i,j1)==0     fv(i,j1)='A';           
                        elseif A(i,j1)==1 fv(i,j1)='G';            
                        elseif A(i,j1)==2 fv(i,j1)='C';            
                        else              fv(i,j1)='U';            
                        end
                    end
                case 3
%                     disp('3');
                    for j1=(j-2)*4+1:(j-2)*4+8                   
                        if A(i,j1)==0     fv(i,j1)='U';           
                        elseif A(i,j1)==1 fv(i,j1)='C';            
                        elseif A(i,j1)==2 fv(i,j1)='G';            
                        else              fv(i,j1)='A';            
                        end
                    end
                case 4
%                     disp('4');
                    for j1=(j-2)*4+1:(j-2)*4+8                    
                        if A(i,j1)==0     fv(i,j1)='U';           
                        elseif A(i,j1)==1 fv(i,j1)='G';            
                        elseif A(i,j1)==2 fv(i,j1)='C';            
                        else              fv(i,j1)='A';            
                        end
                    end
                case 5
%                     disp('5');
                    for j1=(j-2)*4+1:(j-2)*4+8                     
                        if A(i,j1)==0     fv(i,j1)='G';           
                        elseif A(i,j1)==1 fv(i,j1)='U';            
                        elseif A(i,j1)==2 fv(i,j1)='A';            
                        else              fv(i,j1)='C';            
                        end
                    end
                case 6
%                     disp('6');
                    for j1=(j-2)*4+1:(j-2)*4+8                    
                        if A(i,j1)==0     fv(i,j1)='G';           
                        elseif A(i,j1)==1 fv(i,j1)='A';            
                        elseif A(i,j1)==2 fv(i,j1)='U';            
                        else              fv(i,j1)='C';            
                        end
                    end
                case 7
%                     disp('7');
                    for j1=(j-2)*4+1:(j-2)*4+8                   
                        if A(i,j1)==0     fv(i,j1)='C';           
                        elseif A(i,j1)==1 fv(i,j1)='U';            
                        elseif A(i,j1)==2 fv(i,j1)='A';            
                        else              fv(i,j1)='G';            
                        end
                    end
                case 8
%                     disp('8');
                    for j1=(j-2)*4+1:(j-2)*4+8                     
                        if A(i,j1)==0     fv(i,j1)='C';           
                        elseif A(i,j1)==1 fv(i,j1)='A';            
                        elseif A(i,j1)==2 fv(i,j1)='U';            
                        else              fv(i,j1)='G';            
                        end
                    end
            end
        end
    end
end