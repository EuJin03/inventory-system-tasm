.model small
.stack 100h
.data
	INVENTORY_SIZE equ 15 ; number of items in inventory array
	; inventory on id, name, quantity, price, priority level
	inventory_id dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,'$'
	inventory_name db "Apples    ", "Bananas   ", "Carrots   ", "Oranges   ", "Broccoli  ", "Potatoes  ", "Tomatoes  ", "Spinach   ", "Onions    ", "Lemons    ", "Limes     ", "Milk      ", "Eggs      ", "Bread     ", "Cheese    ", '$'
	inventory_quantity dw 10, 15, 8, 20, 5, 12, 7, 3, 6, 9, 11, 8, 24, 15, 6, '$'
	inventory_price dw 1, 7, 1, 1, 2, 7, 1, 2, 7, 1, 7, 3, 2, 1, 5, '$'
	inventory_priority dw 1, 0, 1, 1, 2, 0, 1, 2, 0, 1, 0, 3, 2, 1, 5, '$'

	; syntax formatting
	crlf db 13,10,'$'
	sline db 13,10, '----------------------------------------------' ,'$'
	dline db 13,10, '==============================================' ,'$'
	dotted db 13,10, '**********************************************','$'
	
	; main menu
	menu db 13,10, '----------<APU MINI GROCERY STALL>----------',13,10, '------------------MAIN MENU-----------------', 13, 10, 10 ,'1. View Inventory',13,10,'2. Restock Item',13,10,'3. Sell Items',13,10,'4. Update Item',13,10, '5. Search Item',13,10,'6. Sales Report',13,10,'7. Exit',13,10,'$'
	invalid_input db 13,10,'Invalid input. Please try again.',13,10,'$'
	
	; CRUD labels
	; view inventory
	inventory_header db 13,10, '----------<APU MINI GROCERY STALL>----------',13,10, '-----------------<INVENTORY>-----------------',13,10,'ID',9,'Name',9,9, 'Quantity',9,13,10,'$'
	
	; add items
	
	; deduct items 


	

	; misc
	user_choice db 13, 10, 'Enter your choice: $'
	user_quit db 13, 10, 'Thanks for using the program. See you again.','$'

.code
start:
	mov ax, @data ; set data segment
	mov ds, ax ; set data segment register
	
	;Display the menu
	call draw_menu
	
	;Prompt user to enter choice
	mov ah, 01h ; read character
	int 21h
	
	;Check user input
	cmp al, '1'
	je view_inventory
	
	cmp al, '2'
	je restock_inventory
	
	cmp al, '3'
	je sales_inventory

	cmp al, '4'
	je search_inventory
	
	cmp al, '5'
	je sales_report 
	
	cmp al, '6'
	je exit_program 

	jmp start

	
	call exit_program

; ********************************************
; ************** CRUD FUNCTIONS **************
; ********************************************
draw_menu:
	; Code to draw menu
	call clear_screen
	lea dx, menu
	mov ah, 09h
	int 21h
	
	lea dx, user_choice
	mov ah, 09h
	int 21h
	ret

view_inventory:
	; code to view inventory 
	call clear_screen
	mov dx, offset inventory_header
	mov ah, 09
	int 21h
	
	mov bp, 0
	lea si, inventory_quantity
	lea sp, inventory_id + 1 ; load inventory id into si
	lea di, inventory_price

loop_start:
	mov ax, sp ; load inventory id into ax
	cmp ax, 16 ; check if end of array
	je done 
	call print_word 

	call print_tab

	; print inventory name
	mov dx, offset inventory_name
	add dx, bp
	call print_string

	call print_tab
	
	; print inventory quantity
	mov ax, [si]
	call print_word
	call print_tab

	call print_newline

	add bp, 10
	add si, 2 ; increment SI to point to the next word
	add sp, 1
	add di, 2
	jmp loop_start ; repeat the loop for the next element
	
done:
	mov ah, 4ch
	int 21h
	ret

restock_inventory:
	; Code to add item
	call start
	ret 

highlight_restock_items:
	; Code to highlight items that need to be restocked
	ret

prompt_order_items:
	; Code to prompt user to order items
	ret

sales_inventory:
	; Code to sell item
	ret

search_inventory:
	; Code to search item
	ret

sales_report:
	; Code to generate sales report
	ret

; **********************************************
; ************** HELPER FUNCTIONS **************
; **********************************************
exit_program:
	; Code to exit program
	call draw_line

	lea dx, user_quit
	mov ah, 09h
	int 21h 
	
	call draw_line

	mov ah, 4ch
	int 21h

clear_screen:
	; Function to clear the screen
  mov ah, 06h
  mov al, 0
  mov bh, 07h
  mov cx, 0
  mov dx, 184Fh
  int 10h
  ret

draw_line:
	; Function to draw a line
	lea dx, sline
	mov ah, 09h
	int 21h
	ret

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
print_string:
	; Print a string of characters
	; Input: CX = length of string, DX = offset of string
	push ax ; save registers
	push bx
	push cx
	mov bx, dx ; initialize si with the offset of string
	mov cx, 10 ; set the length to 10 characters
	mov ah, 02h ; character output function
	print_loop:
			mov dl, [bx] ; load character from memory
			cmp dl, '$' ; check for end of string
			je print_done ; if end of string, exit loop
			int 21h ; output the character
			inc bx ; increment offset to next character
			loop print_loop ; repeat until 10 characters are printed
	print_done:
	pop cx ; restore registers
	pop bx
	pop ax
	ret
print_tab:
	mov dl, 09
	mov ah, 02
	int 21h
	ret
print_newline:
	mov dl, 0ah
	mov ah, 02
	int 21h
	ret
print_float:
	; convert the float to a string and print it
	push ax ; save AX on the stack
	push bx ; save BX on the stack
	push cx ; save CX on the stack
	push dx ; save DX on the stack
	; separate the integer and fractional parts of the float
	mov bx, ax ; copy the float to BX
	mov cx, 10 ; set CX to 10 (divisor)
	xor dx, dx ; clear DX (remainder)
	div cx ; divide the float by 10
	mov ax, bx ; copy the float to AX
	mov cx, 0 ; clear CX (counter)

	; convert the integer part of the float to a string
	mov bx, 10 ; set BX to 10 (divisor)
	xor dx, dx ; clear DX (remainder)

int_part:
	xor dx, dx ; clear DX (remainder)
	div bx ; divide the integer by 10
	add dl, '0' ; convert the remainder to ASCII
	push dx ; save the ASCII character on the stack
	inc cx ; increment the counter
	test ax, ax ; check if the integer part is zero
	jnz int_part ; if not, repeat the loop
    
	; print the integer part of the float
	mov ah, 02h ; set AH to 02h (print character)
	pop dx ; get the first ASCII character from the stack

print_int_part:
	int 21h ; print the ASCII character
	loop print_int_part ; repeat the loop for the remaining characters

	; print the decimal point
	mov dl, '.' ; set DL to the decimal point
	mov ah, 02h ; set AH to 02h (print character)
	int 21h ; print the decimal point

	; convert the fractional part of the float to a string
	mov bx, 10000 ; set BX to 10000 (divisor)

frac_part:
	xor dx, dx ; clear DX (remainder)
	mul bx ; multiply the fractional part by 10000
	div cx ; divide the result by 10
	add dl, '0' ; convert the remainder to ASCII
	push dx ; save the ASCII character on the stack
	dec cx ; decrement the counter
	cmp cx, 0 ; check if the fractional part is zero
	jnz frac_part ; if not, repeat the loop
	
	; print the fractional part of the float
	mov ah, 02h ; set AH to 02h (print character)
	pop dx ; get the first ASCII character from the stack

print_frac_part:
	int 21h ; print the ASCII character
	loop print_frac_part ; repeat the loop for the remaining characters

	; restore the registers
	pop dx ; restore DX from the stack
	pop cx ; restore CX from the stack
	pop bx ; restore BX from the stack
	pop ax ; restore AX from the stack
	ret

end start