
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100h

.DATA
    PROMPT DB 0AH,0DH,'Enter a character: $'
    CHAR DB ?
    COUNT DW 50
    NL DB 0AH,0DH,'$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 09h
    INT 21h

    ; Read character input
    MOV AH, 01h
    INT 21h
    MOV CHAR, AL

    ; Display character 50 times on the next line
    MOV CX, 50
    LEA DX, NL
    MOV AH, 09h
    INT 21h

LOOP:
    MOV DL, CHAR
    MOV AH, 02h
    INT 21h
    DEC CX
    JNZ LOOP

    ; Exit program
    MOV AH, 4Ch
    INT 21h

    MAIN ENDP
END MAIN


ret




