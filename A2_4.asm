name "Aufgabe 2.4"

MOV AX, 5;
MOV CX, 1;

CMP CX,0
JZ zero
CMP CX,1
JZ one
CMP CX,2
JZ two       

AND CL,073H     
JMP end         

zero: 
    SHL CX,1    
    JMP end
one: 
    SHR CX,1     
    JMP end
two:
    XOR CL,07EH     
    JMP end
      
end:

HLT