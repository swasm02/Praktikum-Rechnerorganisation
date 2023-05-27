name "Aufgabe 4"

MOV AL, 07H
MOV BL, 08H
ADD AL,BL  
CALL bcdcorrect
;Testfall 1: Erwartetes Ergebnis in AX: 0015H

MOV AL, 79H
MOV BL, 79H
ADD AL,BL  
CALL bcdcorrect
;Testfall 2: Erwartetes Ergebnis in AX: 0158H

MOV AL, 32H
MOV BL, 45H
ADD AL,BL  
CALL bcdcorrect
;Testfall 3: Erwartetes Ergebnis in AX: 0077H

MOV AL, 72H
MOV BL, 93H
ADD AL,BL  
CALL bcdcorrect
;Testfall 4: Erwartetes Ergebnis in AX: 0165H

HLT  

bcdcorrect PROC 
    MOV CL, 1H  ; Carry Backup nach CL
    JC saveNC
    MOV CL, 0H 

saveNC:    
    LAHF        ; Auxillary Flag (AF) nach CH
    MOV CH, AH
    AND CH, 10H ; loeschen aller Flags ausser AF
    SHR CH, 4   ; AF nun im LSB von CH
    MOV AH, CL  ; Carry Backup von CL nach AH
                ; Ueberschreiben des AF mit dem CF
  
    ;Ueberpruefen der unteren Tetrade  
    ; Check: Uebertrag?
    CMP CH, 1   ; AF = 1?
    JZ correction_low
    ; Check: Pseudotetrade? 
    MOV DL, AL 
    AND DL, 0FH
     
    CMP DL, 0AH
    JZ correction_low
    CMP DL, 0BH
    JZ correction_low
    CMP DL, 0CH
    JZ correction_low
    CMP DL, 0DH
    JZ correction_low
    CMP DL, 0EH
    JZ correction_low
    CMP DL, 0FH
    JZ correction_low       
    
    
; Ueberpruefen der oberen Tetrade
check_high:    
    ; Check: Uebertrag?
    CMP AH, 1   ; CF = 1?
    JZ correction_high
    ; Check: Pseudotetrade?
    MOV DL, AL
    AND DL, 0F0H
    
    CMP DL, 0A0H
    JZ correction_high 
    CMP DL, 0B0H
    JZ correction_high
    CMP DL, 0C0H
    JZ correction_high
    CMP DL, 0D0H
    JZ correction_high
    CMP DL, 0E0H
    JZ correction_high
    CMP DL, 0F0H
    JZ correction_high
    JMP fertig
    
; wenn untere korrigiert werden muss -> +0110 = 6H
correction_low:
    ADD AL, 06H
    JMP check_high    
    
; wenn obere korrigiert werden muss -> +0110 0000 = 60H
correction_high:
    ADD AL, 60H
    JC carry_in_AX
    JMP fertig

; Carry in correction_high -> speichern in AX
carry_in_AX:
    mov AH, 1
    JMP fertig   
    
fertig:
    RET
    bcdcorrect ENDP