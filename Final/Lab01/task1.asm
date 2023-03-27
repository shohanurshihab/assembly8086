
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
msg1 db 0dh, 0ah, 'Enter a character: $'
msg2 db 0dh, 0ah, 'Printing: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    mov ah, 1
    int 21h
    
    cmp al, 'A'
    jge cl5
    jmp cl6
    
    cl5:
    mov cl, 35h
    mov ah, 9
    lea dx, msg2
    int 21h
    mov ah, 2
    mov dl, cl
    int 21h
    jmp exit_
    
    cl6:
    mov cl, 36h
    mov ah, 9
    lea dx, msg2
    int 21h
    mov ah, 2
    mov dl, cl
    int 21h
    
    exit_:   
    
    main endp
end main




