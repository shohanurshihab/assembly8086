
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
ms1 db 0dh,  '0 in AX$'
ms2 db 0dh,  '0 in BX$'
ms3 db 0dh,  '0 in CX$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;pre-defining registers
    mov ax, 8
    mov bx, 9
    mov cx, 8
    
    ;if AX<BX
    cmp ax, bx
    jl _ax
        
    ;if BX<CX
    cmp bx, cx
    jl _bx
    
    ;else
    mov ah, 9h
    lea dx, ms3
    int 21h
    mov cx, 0
    jmp exit_
    
    _ax:
    mov ax, 0
    mov ah, 9h
    lea dx, ms1
    int 21h
    jmp exit_
    
    _bx:
    mov bx, 0
    mov ah, 9h
    lea dx, ms2
    int 21h
    
    exit_:
    
    MAIN ENDP
END MAIN

