.model small
.stack 100h

.data
inventory dw 1,2,3,4,5,6,7,8,9,101
new_value dw ?
message db 'Enter new value: $'

.code
start:
mov ax, @data
mov ds, ax   

; display message
mov ah, 9
lea dx, message
int 21h

; read user input
mov ah, 1
int 21h
sub al, 30h ; convert ASCII character to number
mov cx, ax

; modify 5th element of inventory array
mov ax, offset inventory
add ax, 8 ; offset of 5th element in array
mov word ptr [ax], cx

mov si, offset inventory
loop_start:
    mov ax, [si] ; load inventory id into ax
    cmp ax, 101 ; check if end of array
    ja done 
    call print_int

    add si, 2 ; increment SI to point to the next word
    jmp loop_start ; repeat the loop for the next element
done:

mov ah, 4ch
int 21h
print_int:
	; convert the word to a string and print it
	push bx ; save BX on the stack
	mov bx, 10 ; set BX to 10 (divisor)
	xor cx, cx ; clear CX (counter)
	convert_loop:
		xor dx, dx ; clear the high byte of DX
		div bx ; divide AX by BX
		add dl, '0' ; convert the remainder to ASCII
		push dx ; save the digit on the stack
		inc cx ; increment the counter
		cmp ax, 0 ; check if AX is zero
		jne convert_loop ; if not, repeat the loop
	print_loop2:
		pop dx ; get the next digit from the stack
		mov ah, 02 ; write character
		int 21h ; print the digit
		dec cx ; decrement the counter
		cmp cx, 0 ; check if all digits have been printed
		jne print_loop2 ; if not, repeat the loop
		pop bx ; restore BX from the stack
		ret
end start

