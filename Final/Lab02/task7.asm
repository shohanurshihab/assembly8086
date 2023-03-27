org 100h
.model small
.stack 100h
.data
msg db 0dh, 0ah, 'Insert: $'
input db 100
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;counter for WHILE loop
    mov bx, 0
    
    while:
    ;taking string input
    mov ah, 9
    lea dx, msg
    int 21h
    mov ah, 0ah
    mov dx, offset input
    int 21h
    
    ;comparing the input whether the length is greater than 5
    cmp input[1], 5
    jg end_while
    
    inc bx
    int 21h
    jmp while
    
    end_while:
    
    main endp
end main
