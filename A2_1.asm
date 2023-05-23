name "Aufgabe 2.1"

MOV AX, 5;
MOV CX, 1;

CMP AX, 0000H
JZ yes
JMP no

yes:
    MOV BX,0100   
    JMP end
no:
    MOV BX,0100H
    JMP end
end: 

HLT