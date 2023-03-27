org 100h
.model small
.stack 100h
.data
msg1 db 0dh, 0ah, 'Insert value for DL: $'
msg2 db 0dh, 0ah, 'Insert value for CL: $'
res db 0dh, 0ah, 'Indicator: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;taking input for DL
    mov ah, 9
    lea dx, msg1
    int 21h
    mov ah, 1
    int 21h
    mov dl, al
    ;taking input for CL
    mov ah, 9
    lea dx, msg2
    int 21h
    mov ah, 1
    int 21h
    mov cl, bl
    
    ;comparing whether DL and CL values are less than 3
    cmp dl, 33h
    jge exit_
    cmp cl, 33h
    jge exit_
    
    ;if less, showing 'b'
    mov ah, 9
    lea dx, res
    int 21h
    mov dl, 'b'
    mov ah, 2
    int 21h
    
    exit_: 
    main endp
end main
