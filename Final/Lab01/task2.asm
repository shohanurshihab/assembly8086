
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
msg1 db 0dh, 0ah, 'Enter a character: $'
msg2 db 0dh, 0ah, 'Output: $'
msg3 db "Just a thing...$" 
msg4 db 0dh, 0ah, 'returning to dos... $'
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
    je carriage_return
    
    
    cmp al, 'B'
    je line_feed
    JNE dos
    
    carriage_return:
    mov ah, 9
    lea dx, msg2 
    INT 21H
    mov ah, 2
    mov dl, 0dh
    int 21h 
    MOV AH,9
    lea Dx,msg3
    INT 21H
    JMP exit
    
    
    line_feed:
    mov ah, 9
    lea dx, msg2 
    INT 21H
    mov ah, 2
    mov dl, 0ah
    int 21h 
    MOV AH,9
    lea Dx,msg3
    INT 21H
    JMP exit
    
    dos:
    mov ah, 9
    lea dx, msg2 
    INT 21H
    mov ah, 9
    lea dx, msg4 
    INT 21H 
    mov ah, 4ch
    int 21h
   
     
    exit:   
    
   
    main endp
end main





