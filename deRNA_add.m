%% 子函数 RNA加法运算
% DNA 加法运算规则？
% + A U G C
% A A U G C
% U U C A G
% G G A C U
% C C G U A
function Out=deRNA_add(char2,char1)
switch char1
    case 'A'
        Out=char2;
    case 'U'   
        if char2=='U' Out='A';
        elseif char2=='C' Out='U';
        elseif char2=='A' Out='G';
        elseif char2=='G' Out='C';
        end
    case 'G'
        if char2=='G' Out='A';
        elseif char2=='A' Out='U';
        elseif char2=='C' Out='G';
        elseif char2=='U' Out='C'; 
        end
    case 'C'    
        if char2=='C' Out='A';
        elseif char2=='G' Out='U';
        elseif char2=='U' Out='G';
        elseif char2=='A' Out='C';
        end
end