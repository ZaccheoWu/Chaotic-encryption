%% 子函数 RNA同或运算
% RNA同或运算规则
%? A U G C
% A A U G C
% U U A C G
% G G C A T
% C C G U A
function Out=DNA_xnor(char1,char2)
switch char2
    case 'A'
        if char1=='A' Out='U';
        elseif char1=='U' Out='A';
        elseif char1=='G' Out='C';
        elseif char1=='C' Out='G';
        end
    case 'U'  
        Out=char1;
    case 'G'
        if char1=='A' Out='C';
        elseif char1=='U' Out='G';
        elseif char1=='G' Out='U';
        elseif char1=='C' Out='A'; 
        end
    case 'C'    
        if char1=='A' Out='G';
        elseif char1=='U' Out='C';
        elseif char1=='G' Out='A';
        elseif char1=='C' Out='U';
        end
end
