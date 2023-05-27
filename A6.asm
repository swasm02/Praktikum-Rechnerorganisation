include "data6_1.inc"
name "Aufgabe 6"     

; Basisfall x^0
MOV AX, 1   

; Abspeichern der Speicheradresse    
MOV BX, BP                       

; Abspeichern der Basis
MOV CX, [BP]

mult:    
    ; Erhoehen der Speicheradresse
    INC BX                        
    
    ; Abspeichern von AL in der neuen Speicheradresse
    MOV [BX], AX                                     
    
    ; Multiplikation des alten Wertes mit der Basis 
    ; damit man auf die naechste Potenz kommt
    MUL CL

    ; Ueberpruefung, ob AX = AL, ob also das Ergebnis 
    ; der Multiplikation noch darstellbar ist (2 Byte)  
    MOV DX, 0
    MOV DL, AL
                                                                                         
    CMP AX, DX
    JZ mult

HLT 