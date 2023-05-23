name "Aufgabe 2.2"

MOV AX, 5;
MOV CX, 1;

begin:
    CMP AX, 0000H
    JZ end
    DEC AX
    JMP begin

end:

HLT