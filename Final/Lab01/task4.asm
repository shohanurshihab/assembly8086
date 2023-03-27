ORG 100h
.model small
.stack 100h
.data


message db 'Enter anything: $'
input db 0ah,0dh,'Output:$'
continue_message db 'Continue? (y/n): $'
.code
start:
    mov ax, @data
    mov ds, ax 
    
  mov ah, 09h ; display prompt for input
  lea dx, message
  int 21h
  
  mov ah, 1 ; read user input
  int 21h
  mov bl, al
  
  mov ah, 09h   ; display input 
  lea dx, input
  int 21h
  
                 
  mov ah, 02h ; display character on next line
  mov dl,bl
  int 21h
  mov dl, 0dh
  int 21h
  mov dl, 0ah
  int 21h
  
  mov ah, 09h ; display prompt to continue
  lea dx, continue_message
  int 21h
  
  
  mov ah, 01h ; read user response
  int 21h 
  mov bl, al
   
  mov ah,2
  mov dl, 0dh
  int 21h
  mov dl, 0ah
  int 21h
  
    
  cmp bl, 'y' ; check if user wants to continue
  je start ; repeat if 'y' or 'Y'
  
  
  mov ah, 4ch ; terminate program
  int 21h
  
