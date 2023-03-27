org 100h
.model small
.stack 100h
.data
msg db 0dh, 0ah, 'Insert for AL: $'
input db 0dh, 0ah, 'Insert a character: $'
print db 0dh, 0ah, 'Inserted character: $'
input_value db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;taking input for AL register
    mov ah, 9
    lea dx, msg
    int 21h
    mov ah, 1
    int 21h
    
    ;comparing whether AL is in 2 to 9 range
    cmp al, 32h
    jb else_
    cmp al, 39h
    ja else_
    jmp then_
    
    ;taking and printing input as AL is in 2 to 9 range
    then_:
    mov ah, 9     ;taking
    lea dx, input
    int 21h
    mov ah, 1
    int 21h
    mov input_value, al
    
    mov ah, 9     ;printing
    lea dx, print
    int 21h
    mov ah, 2
    mov dl, input_value
    int 21h
    jmp exit_
    
    else_:
    cmp al, 'c'
    je print_c
    jmp print_n
    
    print_c:
    mov ah, 2
    mov dl, 'c'
    int 21h
    jmp exit_
    
    print_n:
    mov ah, 2
    mov dl, 'n'
    int 21h
    
    exit_:   
    
    main endp
end main
