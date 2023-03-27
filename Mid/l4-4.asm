
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100h

.DATA
    PROMPT DB 0AH,0DH,'Enter a number: $'
    MSG_LESS DB 'Less than 5$'
    MSG_GREATER DB 'Greater than 5$'
    MSG_EQUAL DB 'Equal to 5$'
  

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 09h
    INT 21h

    ; Read integer input
    MOV AH, 01h
    INT 21h
    SUB AL, 30h ; convert ASCII digit to binary value

    ; Compare input to value of CL
   
    CMP AL, 5
    JL LESS
    JG GREATER
    JE EQUAL

LESS:
    ; Input is less than 5
    LEA DX, MSG_LESS
    JMP DISPLAY_MSG

GREATER:
    ; Input is greater than 5
    LEA DX, MSG_GREATER
    JMP DISPLAY_MSG

EQUAL:
    ; Input is equal to 5
    LEA DX, MSG_EQUAL
    JMP DISPLAY_MSG

DISPLAY_MSG:
    ; Display comparison message
    MOV AH, 09h
    INT 21h

    ; Exit program
    MOV AH, 4Ch
    INT 21h

    MAIN ENDP
END MAIN


ret




