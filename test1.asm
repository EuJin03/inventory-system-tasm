.model small
.stack 100h
.data
    array db 'hi   $', 'hello$'
.code

main proc
    mov ax,@data
    mov ds, ax

		lea si, array
    mov cx,2
		mov bx, 0
l1:
    cmp cx, 0
		je exit

		mov dx, offset array 
		add dx, bx
    mov ah, 9h
    int 21h
    add bx, 6  
    loop l1
   
exit:
   mov ah, 4ch
  int 21h

main endp
end main