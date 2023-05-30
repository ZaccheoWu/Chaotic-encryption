%% 子函数 RNA补码加法运算
% DNA 补码加法运算规则
% +' A U G C
% A A G U C
% U U A C G
% G G C A U
% C C U G A
function Out=RNA_comp_add(char1,char2)
switch char2
    case 'A'
        if char1=='A' Out='U';
        elseif char1=='U' Out='A';
        elseif char1=='G' Out='C';
        elseif char1=='C' Out='G';
        end
    case 'U'      
        if char1=='A' Out='A';
        elseif char1=='U' Out='G';
        elseif char1=='G' Out='U';
        elseif char1=='C' Out='C';
        end
    case 'G'
        if char1=='A' Out='C';
        elseif char1=='U' Out='U';
        elseif char1=='G' Out='G';
        elseif char1=='C' Out='A'; 
        end
    case 'C'    
        if char1=='A' Out='G';
        elseif char1=='U' Out='C';
        elseif char1=='G' Out='A';
        elseif char1=='C' Out='U';
        end
end