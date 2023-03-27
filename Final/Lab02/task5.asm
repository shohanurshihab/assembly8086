org 100h
.model small
.stack 100h
.data
.code
main proc
    ;initializing counter with cx register
    mov cx, 30
    
    loop_start:
    mov ah, 2
    mov dl, 'x'
    int 21h
    
    dec cx
    
    cmp cx, 20
    jnz skip_nl
    
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    skip_nl:
    cmp cx, 10
    jnz skip_sp
    
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    skip_sp:
    cmp cx, 0
    jnz loop_start
    
    main endp
end main
