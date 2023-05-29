.MODEL SMALL
.STACK 100h
.DATA

TimePrompt	db 'iS IT AFTER 12 NOON (Y/N)?$'
GoodMorningMessage db 13,10, 'GOOD MORNING, WORLD!', 13, 10, '$' ; 13,10 is the carriage return and line feed, db is the directive for defining a byte, $ is the null terminator
GoodAfternoonMessage db 13,10, 'GOOD AFTERNOON, WORLD!', 13, 10, '$'
DefaultMessage db 13,10, 'GOOD DAY, WORLD!', 13, 10, '$'

;CR - Move to the beginning of the current line
;LF - Move to the beginning of the next line

.CODE
start:
mov ax,@data 
mov ds,ax ;set DS to point to the data segmetn
mov dx,OFFSET TimePrompt ;point to the time prompt, dx is the data register, ds is the data segment register, OFFSET is a macro that returns the offset of the label
mov ah,9 ;DOS: print string
int 21h ;display the time prompt
mov ah,1 ;DOS: get character
int 21h ;get a single-character response
or al,20h ;force character to lower case

cmp al,'y' ;read inputs, typed Y for afternoon?
je IsAfternoon 
cmp al, 'n' ;read inputs, typed N for morning?
je IsMorning

mov dx,OFFSET DefaultMessage ;default greeting
jmp DisplayGreeting

IsAfternoon:
mov dx,OFFSET GoodAfternoonMessage
jmp DisplayGreeting

IsMorning:
mov dx,OFFSET GoodMorningMessage

DisplayGreeting:
mov ah,9 ;DOS: print string
int 21h ;display the appropriate greeting
mov ah,4ch ;DOS: terminate program
mov al,0 ;return code will be 0
int 21h ;terminate program
END start 