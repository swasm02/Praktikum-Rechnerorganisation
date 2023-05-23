#start=led_display.exe#
name "Aufgabe 3"
    
MOV AX,-21                  ;damit der Zaehler bei -20 gestartet wird
                            ; (bei der Berechnung der Nummer erfolgt zuerst ein INC)
                  
main:
    CALL nummer_berechnung  ;berechnet die Nummer
    CALL display            ;stellt die Nummer dar
    CALL warten             ;wartet eine Sekunde (1.000.000 Mikrosekunden)
    JMP main
 
nummer_berechnung:
    INC AX                  ;erhoeht den Zaehler um eins
    CMP AX,21               ;Vergleich, ob bereits 20 ausgegeben wurde
    JNE return
    MOV AX,-20              ;trifft dies zu, so wird der Zaehler auf -20 gesetzt                   

return: 
    ret

display:
    OUT 199,AX              ;Ausgabe ueber den Zaehler
    ret

warten:                     ;Zwischenspeichern von AX auf dem Stack
    PUSH AX
    MOV CX,0FH              ;Einstellen von einer 1 Sekunde
    MOV DX,4240H            ; (000F 4240H = 1.000.000 Mikrosek = 1s)
    MOV AH,86H              ;Kenntlichmachung, dass Interrupt 15,86 aufgerufen wird
    INT 15H
    POP AX                  ;Extrahieren des gespeicherten Wertes
    ret
