%% 子函数 RNA加法运算
% DNA 加法运算规则？
% + A U G C
% A A U G C
% U U C A G
% G G A C U
% C C G U A
function Out=RNA_add(char1,char2)
switch char1
    case 'A'
        Out=char2;
    case 'U'   
        if char2=='A' Out='U';
        elseif char2=='U' Out='C';
        elseif char2=='G' Out='A';
        elseif char2=='C' Out='G';
        end
    case 'G'
        if char2=='A' Out='G';
        elseif char2=='U' Out='A';
        elseif char2=='G' Out='C';
        elseif char2=='C' Out='U'; 
        end
    case 'C'    
        if char2=='A' Out='C';
        elseif char2=='U' Out='G';
        elseif char2=='G' Out='U';
        elseif char2=='C' Out='A';
        end
end
