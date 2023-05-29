.model small
.stack 100h

.data
    inventory_name db "Apples    ", "Bananas   ", "Carrots   ", "Oranges   ", "Broccoli  ", "Potatoes  ", "Tomatoes  ", "Spinach   ", "Onions    ", "Lemons    ", "Limes     ", "Milk      ", "Eggs      ", "Bread     ", "Cheese    ", '$'

.code
start:
    mov ax, @data
    mov ds, ax
    
    ; calculate the offset of "Onions"
    mov bx, offset inventory_name + 90 ; "Onions" is the 9th element, each element takes up 10 bytes

    ; print "Onions"
    lea dx, [bx] ; dx = offset inventory_name + 80
    mov cx, 10  ; print only the first 10 bytes
    call print_string
    
    ; rest of the code
    ; ...

    mov ah, 4ch ; exit program
    int 21h

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

end start