
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h       

;DISPLAY ? MARK
MOV AH,2
MOV DL,63
INT 21H     

;TAKING INPUT
MOV AH,1
INT 21H

;SAVE IN BL
MOV BL,AL

;taking input 2   
MOV AH, 1
INT 21H
ADD BL,AL 
sub bl,30h 



;NEW LINE
MOV AH,2
MOV DL,0DH
INT 21H

;
MOV DL,0AH
INT 21H

;CHARACTER SHOW
MOV DL,BL
INT 21H       


;DOS
MOV AH,4CH
INT 21H
ENDP 
END MAIN


ret




