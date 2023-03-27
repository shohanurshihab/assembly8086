org 100h
.model small
.stack 100h
.data
msg db 0dh, 0ah, 'Insert: $'
sum_msg db 0dh, 0ah, 'Summation: $'
sub_msg db 0dh, 0ah, 'Subtraction: $'
input_msg db 0dh, 0ah, 'Input: $'
other_msg db 0dh, 0ah, 'Random Character: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;taking input
    mov ah, 9
    lea dx, msg
    int 21h
    mov ah, 1
    int 21h
    
    ;comparing input whether 1, 2, 3 or other
    cmp al, 31h
    je sum_2_3
    cmp al, 32h
    je sub_4_3
    cmp al, 33h
    je input_
    jmp other_
    
    ;printing summation if input = 1
    sum_2_3:
    mov ah, 9
    lea dx, sum_msg
    int 21h
    
    mov ax, 32h
    add ax, 33h
    mov ah, 2
    sub ax, 30h
    mov dx, ax
    int 21h
    jmp exit_
    
    ;printing subtraction if input = 2
    sub_4_3:
    mov ah, 9
    lea dx, sub_msg
    int 21h
    
    mov ax, 34h
    sub ax, 33h
    mov ah, 2
    add ax, 30h
    mov dx, ax
    int 21h
    jmp exit_:
    
    ;printing input if input = 3
    input_:
    mov ah, 9
    lea dx, input_msg
    int 21h
    
    mov ah, 2
    mov dl, al
    int 21h
    jmp exit_:
    
    ;printing a character if input = 4
    other_:
    mov ah, 9
    lea dx, other_msg
    int 21h
    
    mov ah, 2
    mov dl, 'x'
    int 21h
    
    exit_:
    main endp
end main
