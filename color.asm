.model small
.code
.stack 100
start:
    mov ah, 09h
    mov bl, 8Dh
    mov cx, 6
    INT 10h
    
    mov ah, 2
    mov dl, 45h
    Int 21h
    mov ah, 2
    mov dl, 55h
    Int 21h
    mov ah, 2
    mov dl, 47h
    Int 21h
    mov ah, 2
    mov dl, 45h
    Int 21h
    mov ah, 2
    mov dl, 4Eh
    Int 21h
    mov ah, 2
    mov dl, 45h
    Int 21h

Int 27h
end start