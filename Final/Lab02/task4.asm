org 100h
.model small
.stack 100h
.data
.code
main proc
    ;initializing the counter with cx register
    mov cx, 30
    
    ;printing 'x' for 30 times in using FOR loop
    forloop_:
    mov ah, 2
    mov dl, 'x'
    int 21h
    loop forloop_
    
    main endp
end main
