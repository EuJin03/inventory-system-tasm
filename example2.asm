.model small
.stack 100h
.data
    ; inventory on id, name, quantity, price, priority level
    inventory_id dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, '$' 
    inventory_name db "Apples", "Bananas", "Carrots", "Oranges", "Broccoli", "Potatoes", "Tomatoes", "Spinach", "Onions", "Lemons", "Limes", "Milk", "Eggs", "Bread", "Cheese", '$'

.code
start:
    mov ax, @data ; set data segment
    mov ds, ax ; set data segment register

    ; Print the inventory_id array
    lea si, inventory_id ; set SI to the start of the array
print_loop:
    mov ax, [si] ; load the next word from the array
    cmp ax, '$' ; check if the terminator character has been reached
    je done ; if yes, exit the loop
    call print_word ; print the word
		
		mov dl, 20h
		mov ah, 02h 
		int 21h 
		
    add si, 2 ; increment SI to point to the next word
    jmp print_loop ; repeat the loop for the next element

done:
    ; code to exit or continue with the program
    ; ...

print_word:
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