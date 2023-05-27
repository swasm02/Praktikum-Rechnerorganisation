#start=thermometer.exe#
name "Aufgabe 7" 
; selbst ausgedachte Basiswerte: 70 und 90 Grad
MOV [BP], 70
MOV [BP+1], 90

; Tmin in BL
MOV BL, [BP]    
; Tmax in BH
MOV BH, [BP + 1]

; Zustand Brenner aus
brenner_aus: 
    MOV AL, 0
    OUT 127, AL 
    ; T_ist in AL
    IN AL, 125
    CMP AL, BL
    JB brenner_an       ;T_ist < Tmin
    JMP brenner_aus


; Zustand Brenner an
brenner_an:    
    MOV AL, 1
    OUT 127, AL
    ; T_ist in AL
    IN AL, 125
    CMP AL, BH
    JA brenner_aus      ;T_ist > Tmax 
    JMP brenner_an                  