%% 子函数 RNA异或运算
% RNA异或运算规则
%? A U G C
% A A U G C
% U U A C G
% G G C A T
% C C G U A
function Out=DNA_xor(char1,char2)
switch char2
    case 'A'
        Out=char1;
    case 'U'      
        if char1=='A' Out='U';
        elseif char1=='U' Out='A';
        elseif char1=='G' Out='C';
        elseif char1=='C' Out='G';
        end
    case 'G'
        if char1=='A' Out='G';
        elseif char1=='U' Out='C';
        elseif char1=='G' Out='A';
        elseif char1=='C' Out='U'; 
        end
    case 'C'    
        if char1=='A' Out='C';
        elseif char1=='U' Out='G';
        elseif char1=='G' Out='U';
        elseif char1=='C' Out='A';
        end
end
