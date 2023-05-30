%% 子函数 RNA减法运算
% DNA 减法运算规则
% －A U G C
% A A G U C
% U U A C G
% G G C A U
% C C U G A
function Out=RNA_sub(char1,char2)
switch char2
    case 'A'
        Out=char1;
    case 'U'      
        if char1=='A' Out='G';
        elseif char1=='U' Out='A';
        elseif char1=='G' Out='C';
        elseif char1=='C' Out='U';
        end
    case 'G'
        if char1=='A' Out='U';
        elseif char1=='U' Out='C';
        elseif char1=='G' Out='A';
        elseif char1=='C' Out='G'; 
        end
    case 'C'    
        if char1=='A' Out='C';
        elseif char1=='U' Out='G';
        elseif char1=='G' Out='U';
        elseif char1=='C' Out='A';
        end
end