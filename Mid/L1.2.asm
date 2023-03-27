
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


mov ax,0000H
mov bx,0001H
mov cx,0002H
mov dx,0003H
mov si,0010H
mov di,0020H
mov bp,0030H
mov sp,0B60H 
mov ds,sp

ret




