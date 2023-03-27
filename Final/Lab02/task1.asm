org 100h
.model small
.stack 100h
.data
.code
main proc
    ;taking user input
    mov ah, 1
    int 21h
    mov dl, al
    
    ;comparing whether input is 1 or 3   
    cmp dl, 31h
    je then_
    cmp dl, 33h
    je then_
    jmp else_
    
    ;for 1 or 3, printing 'o'
    then_:
    mov ah, 2
    mov dl, 'o'
    int 21h
    jmp exit_
    
    ;for 2 or 4, printing 'e'
    else_:
    mov ah, 2
    mov dl, 'e'
    int 21h
    
    exit_ :

    main endp
end main
