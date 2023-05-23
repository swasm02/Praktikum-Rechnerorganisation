name "Aufgabe 2.3"

MOV AX, 5;
MOV CX, 1;

loop: 
    INC AX
    MOV BX, AX
    SUB BX, 100
    JZ end   
    JMP loop
    
end:

HLT