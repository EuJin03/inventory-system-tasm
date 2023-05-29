.MODEL small
.STACK 100h

.DATA
inventory DW 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg1 DB 'Enter the index of the element to modify (0-9): $'
msg2 DB 'Enter the new value: $'
newline DB 0dh, 0ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; get user input for index
    LEA DX, msg1
    MOV AH, 9
    INT 21h
    MOV AH, 1
    INT 21h
    SUB AL, '0' ; convert character to number
    MOV BL, AL ; save index in BL

    ; get user input for new value
    LEA DX, msg2
    MOV AH, 9
    INT 21h
    MOV AH, 1
    INT 21h
    MOV CX, AX ; save value in CX

    ; modify the inventory array
    MOV AX, 0 ; clear upper 8 bits of AX
    MOV AL, BL ; move index to AL (lower 8 bits of AX)
    MOV BX, 2 ; multiply index by 2 to get byte offset
    MUL BX ; multiply AX by BX
    LEA SI, inventory ; get base address of inventory array
    ADD SI, AX ; add byte offset to base address
    MOV AX, CX ; move new value to AX
    MOV [SI], AX ; store new value in memory

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

      ; exit program
      MOV AH, 4Ch
      INT 21h

MAIN ENDP

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

END MAIN