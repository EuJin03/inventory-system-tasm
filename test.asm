.model small
.stack 100h
.data

    SYSTEM_SIZE equ 40
    ;Syntax
    CRLF DB 13,10,'$'
    
    ;Strings for Main Menu Display
    Mheader DB 13, '---------------------<Flash Electronic Management System>-------------------', 13, 10, '------------------MAIN MENU-----------------', 13, 10, 10 ,'1.Sell Electronic Devices or Accesories', 13, 10, '2. View Storage Inventory', 13, 10, '3.Items Restock', 13, 10, '4. Sort Items In ...',13, 10, '0. Exit the Program', 13, 10, '$'
    user_input DB 13,10, 'Select an Option: $'
    
    ;View Inventory Header
    INVTheader DB 13,10,'-----------------<Flash Electronic Management System>-----------------',13,10,'------------------------<INVENTORY>----------------------',13,10,'ID',9,'Name',9,9,9,9,'Price',9,9,'Quantity',13,10,'$'
    
    ;Inventory
    ;Item 1 
    item0 DB '1',9,'Flash Tablet Series 1',9,9,'RM2500',9,9,'$'
    item1 DB '2',9,'Flash Phone Pro Max',9,9,'RM5700',9,9,'$'
    item2 DB '3',9,'Flash Camera Ver 8 ',9,9,'RM2500',9,9,'$'
    item3 DB '4',9,'Flash TV 4K ',9,9,9,'RM100000',9,'$'
    item4 DB '5',9,'Flash Flip Zen',9,9,9,'RM4200',9,9,'$'
    
    ;Quantity
    q_Item0 DB 8
    q_Item1 DB 3
    q_Item2 DB 1 
    q_Item3 DB 3 
    q_Item4 DB 5 
    
.code
MAIN PROC
    mov ax, @Data ; Set data segment
    mov ds, ax ; Data register

    call display_menu
    mov ah, 01h ; Read character input
    mov dl,al 
    int 21h

    ;Compare user_input and direct to selected option
    ;cmp al, '1'
    ;je sell_products
    
    cmp al, '2'
    je view_inventory
    
    ;cmp al, '3'
    ;je items_restock

    ;cmp al, '4'
    ;je sort_inventory
    
    ;cmp al, '5'
    ;je generate_report
    
    ;cmp al, '0'
    ;je exit_program

    jmp main
    
; Functions

display_menu:

    mov dx, offset Mheader ; Load offset address of the menu string
    mov ah, 09h ; Print string function
    int 21h
    
    lea dx,user_input
    mov ah,9h
    int 21h
    
    ret


view_inventory:
    mov dx, offset INVTheader
    mov ah, 09h
    int 21h
    
    mov dx, offset item0
    mov ah, 09h
    int 21h

    mov dl, q_Item0 ; Load the quantity from memory to dl
    add dl, '0' ; Convert numerical value to character
    mov ah, 02h ; Display character in dl
    int 21h
    
    mov dx, offset CRLF ; Load offset address of CRLF
    mov ah, 09h ; Print string function
    int 21h
    
    mov dx, offset item1
    mov ah, 09h
    int 21h
    
    mov dl, q_Item1 ; Load the character value of the quantity for item1 into the dl register.
    ;sub dl, '0'        ; Convert the character value to a numerical value.
    cmp dl, 6          ; Compare the numerical value to 6.
    jl highlight_quantity ; If the value is less than 5, jump to highlight_quantity.
    jmp display_quantity  ; Otherwise, jump to display_quantity.

    highlight_quantity:
        ;push ax         ; Save the original color attribute on the stack.
        ;mov ah, 0Ch     ; Set text color to red on black.
        ;mov bh, 0       ; Set the page number to 0.
        ;mov bl, 4       ; Set the color attribute to red.

        ; Display the quantity as a numerical value in red.
        ;mov ah, 02h     ; Set the interrupt function to display a character.
             ; Convert the numerical value back to a character.
             ;int 21h         ; Display the character.

        ;pop ax          ; Restore the original color attribute from the stack.
        ;cbw
        push ax
        push bx 
        push dx
        mov ah,02h
        mov bl,0ch
        int 10h
        pop ax
        pop bx
        pop dx
        call display_quantity
        ret
        
        ;jmp display_quantity
        
        ; Output a carriage return and line feed to start the next line.
        ;mov dx, offset CRLF ; Load offset address of CRLF.
        ;mov ah, 09h ; Print string function.
        ;int 21h
        
        

    display_quantity:
        ; Display the quantity as a numerical value.
        add dl, '0' ; Convert the numerical value back to a character.
        mov ah,02h
        int 21h
        
        

        ; Output a carriage return and line feed to start the next line.
        mov dx, offset CRLF ; Load offset address of CRLF.
        mov ah, 09h ; Print string function.
        int 21h

      

    mov dx, offset CRLF ; Load offset address of CRLF
    mov ah, 09h ; Print string function
    int 21h
    
    mov dx, offset item2
    mov ah, 09h
    int 21h

    mov dl, q_Item2 ; Load the quantity from memory to dl
    add dl, '0' ; Convert numerical value to character
    mov ah, 02h ; Display character in dl
    int 21h

    mov dx, offset CRLF ; Load offset address of CRLF
    mov ah, 09h ; Print string function
    int 21h
    
    mov dx, offset item3
    mov ah, 09h
    int 21h

    mov dl, q_Item3 ; Load the quantity from memory to dl
    add dl, '0' ; Convert numerical value to character
    mov ah, 02h ; Display character in dl
    int 21h

    mov dx, offset CRLF ; Load offset address of CRLF
    mov ah, 09h ; Print string function
    int 21h
    
    mov dx, offset item4
    mov ah, 09h
    int 21h

    mov dl,  q_Item4 ; Load the quantity from memory to dl
    add dl, '0' ; Convert numerical value to character
    mov ah, 02h ; Display character in dl
    int 21h

    mov dx, offset CRLF ; Load offset address of CRLF
    mov ah, 09h ; Print string function
    int 21h
    
    mov ah, 4Ch
    int 21h



    
MAIN ENDP
END MAIN
