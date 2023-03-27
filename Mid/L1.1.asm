; display "?"
mov ah, 9
mov dx, offset message1
int 21h

; read first decimal digit
mov ah, 1
int 21h
sub al, 48 ; convert ascii code to actual digit
mov bl, al ; store first digit

; read second decimal digit
mov ah, 1
int 21h
sub al, 48 ; convert ascii code to actual digit
add bl, al ; add second digit to first digit

; check if sum is less than 10
cmp bl, 10
jge greater

; display the digits and their sum
mov ah, 9
mov dx, offset message2
int 21h

mov dl, bl
add dl, 48
mov ah, 2
int 21h

jmp exit

greater:
; display "The sum is greater than or equal to 10"
mov ah, 9
mov dx, offset message3
int 21h

exit:
; end program
mov ax, 4c00h
int 21h

message1 db '?', 13, 10, '$'
message2 db 'The digits are: ', '$'
message3 db 'The sum is greater than or equal to 10', 13, 10, '$'
