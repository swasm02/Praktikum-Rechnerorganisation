include "data5_1.inc" 
; Gegeben AX:8024H BX:0137H 
; Erwartetes Ergebnis in AX:0113H
name "Aufgabe 5"  
#start=led_display.exe#

; Umwandlung von AX in 2K (wenn noetig)
CMP AX, 8000H
JAE umwandelnAX

; Umwandlung von BX in 2K (wenn noetig)
B:  
    CMP BX, 8000H
    JAE umwandelnBX

; Addition von AX und BX mit Ergebnis in AX                         
addi:
    ADD AX, BX                                                                         

; Ueberpreufung des Ergebnisses
CMP AX, 8000H
JAE umwandelnErgebnis                   
       
;Resulatat auf das Display ausgeben
output: 
    OUT 199, AX
    HLT 

umwandelnAX:        
    SUB AX, 8000H
    NOT AX
    INC AX
    JMP B    
    
umwandelnBX: 
    SUB BX, 8000H
    NOT BX
    INC BX
    JMP addi    
        
umwandelnErgebnis:
    NOT AX
    INC AX     
    JMP output