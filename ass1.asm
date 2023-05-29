.model small
.stack 100h
.data
      
    ;line break
        crlf db 13,10,'$';line break
        line db 13,10,"---------------------------------------------",'$';line
        eql db 13,10,"=============================================",'$';line
        dot db 13,10,"*********************************************",'$';line



    
        mainmenu db 10,13,"----------<APU Cybersecurity Club>----------",10,13
		  db 10,13,"-------<Battle of Hackers Competition>------",10,13
                
                db "*********************************************",10,13,10,13
                db "-----------------<Workshop>------------------",10,13
                db "1.  Join Now.",10,13,10,13
                db "----------------<Challenges>-----------------",10,13
                db "2.  Forensics",10,13
                db "3.  Cryptography",10,13
                db "4.  Reverse Engineering",10,13,10,13
                db "----------------<Activities>-----------------",10,13
                db "5.  Join Now.",10,13,10,13,10,13                                                                                 
                db "6.  Exit",10,13,10,13
                db "*********************************************",10,13
                db "Please select to access:  ",'$'

        line01  db 10,13, "-----------------<Workshop>------------------",10,13
                db 10,13, "         Members can enjoy 50% discount!                  ",10,13,10,13
                db "1.  Member", 10,13
                db "2.  Non-Member",10,13
                db "3.  Back ",10,13,10,13
                db "Select your role:  " ,'$',10,13,10,13
        line01a   db 10,13, "Member Price:  RM8.$"
        line01b   db 10,13, "Non-Member Price:  RM16.$"



        line02 db 10,13, "-----------------<Forensics>-----------------",10,13
                db 10,13, "         Members can enjoy 50% discount!                  ",10,13,10,13
                db "1.  Member", 10,13
                db "2.  Non-Member",10,13
                db "3.  Back ",10,13,10,13
                db "Select your role:  " ,'$',10,13,10,13
        line02a   db 10,13, "Member Price:  RM9.$"
        line02b   db 10,13, "Non-Member Price:  RM18.$"


        line03 db 10,13, "---------------<Cryptography>----------------",10,13
                db 10,13, "         Members can enjoy 50% discount!                  ",10,13,10,13
                db "1.  Member", 10,13
                db "2.  Non-Member",10,13
                db "3.  Back ",10,13,10,13
                db "Select your role:  " ,'$',10,13,10,13
        line03a   db 10,13, "Member Price:  RM6.$"
        line03b   db 10,13, "Non-Member Price:  RM12.$"

        line04 db 10,13, "------------<Reverse Engineering>------------",10,13
                db 10,13, "         Members can enjoy 50% discount!                  ",10,13,10,13
                db "1.  Member", 10,13
                db "2.  Non-Member",10,13
                db "3.  Back ",10,13,10,13
                db "Select your role:  " ,'$',10,13,10,13
        line04a   db 10,13, "Member Price:  RM5.$"
        line04b   db 10,13, "Non-Member Price:  RM10.$"

                                                                                                                                                                                 

        line05 db 10,13, "----------------<Activities>-----------------",10,13
                db 10,13, "         Members can enjoy 50% discount!                  ",10,13,10,13
                db "1, Member", 10,13
                db "2, Non-Member",10,13
                db "3, Back ",10,13,10,13
                db "Select your role:  " ,'$',10,13,10,13
        line05a   db 10,13, "Member Price:  RM7.$"
        line05b   db 10,13, "Non-Member Price:  RM14.$"
               


        line06 db "Thank you!",10,13
             db "",10,13
             db "",10,13
             db "",10,13
             db "",10,13
             db "",10,13
             db "",10,13
             db "",10,13
             db "",10,13
             db "$",10,13

        line07 db 10,13, "1, Back to page",10,13
                db "2, Back to Main Menu ",10,13
                db "Please select: ",'$'

;***************************************************************************************************

    ;price msg & data
        total db ?
        ntik db ?
        price01a db 8
        price01b db 16
        price02a db 9
        price02b db 18
        price03a db 6
        price03b db 12
        price04a db 5
        price04b db 10
        price05a db 7
        price05b db 14
        
        
        

        n2 db ?

        pm1 db 10,13,"Ticket Quantity: $"
        pm2 db 10,13,"Total Price: RM $"
        



;***************************************************************************************************

.code
 main proc
       mov ax, @data
        mov ds, ax

        mov ah,09h  
        lea dx, dot
        int 21h
        lea dx, mainmenu
        int 21h    
                                                                                                
        mov ah,01h          ;reply                                                                    
        int 21h
                                                                                                                                        
        cmp al, '1'                                                                                                                                                                                     
        je CEvent1

        cmp al, '2'                                                                                                                                                                                     
        je CEvent2

        cmp al, '3'                                                                                                                                                                                     
        je CEvent3

        cmp al, '4'                                                                                                                                                                                     
        je CEvent4

        cmp al, '5'                                                                                                                                                                                     
        je CEvent5

        cmp al, '6'                                                                                                                                                                                     
        je CEvent6

        


        call main             ;call function
        CEvent1:
                call Event1

        CEvent2:
                call Event2

        CEvent3:
                call Event3

        CEvent4:
                call Event4

        CEvent5:
                call Event5

        CEvent6:
                call Event6
        

        ;---Functions

;====================================================================================================

Event1:
        mov ax, @data
        mov ds, ax
        mov ah, 09h
        lea dx, crlf
        int 21h
        lea dx, line
        int 21h
        lea dx, crlf
        int 21h
        lea dx, line01
        int 21h
        mov ah, 01h
        int 21h
 
                 cmp al,'1'
                 je E1mp    ;call 1st price                                                                                                                                                                                                                                                       
                 cmp al,'2'
                 je E1nmp    ;call 2nd price
                 cmp al,'3'
                 je E1b   ;back to main
                 call Event1

                 E1mp:
                       call E1_mp
                 E1nmp:
                       call E1_nmp
                 E1b:
                       call E1_b

                 E1_mp:                   ;role
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h                ;rply role
                         lea dx, line01a
                         int 21h
                                mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2 

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h 
                                mov ntik,al

                                mul price01a

                                mov total,al
                                aam

                                add ah,30h ; this line 
                                add al,30h ; 

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply


                               BackE1:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE1    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMain   ;back
                                        call BackE1
                                        
                                        StayE1:
                                             call Event1
                                        BMain:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah, 4ch
                         int 21h
                 E1_nmp:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line01b
                         int 21h

                             mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price01b

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply

                               BackE1a:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE1a    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMaina   ;back
                                        call BackE1a
                                        
                                        StayE1a:
                                             call Event1
                                        BMaina:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah,09h   ;reply
                         int 21h
                         mov ah, 4ch
                         int 21h
                 E1_b:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line
                         int 21h                       
                         call main
                         int 21h
                        
        mov ah, 4ch
        int 21h

Event2:
        mov ax, @data
        mov ds, ax
        mov ah, 09h
        lea dx, crlf
        int 21h
        lea dx, line
        int 21h
        lea dx, crlf
        int 21h
        lea dx, line02
        int 21h
        mov ah, 01h
        int 21h
 
                 cmp al,'1'
                 je E2mp    ;call 1st price                                                                                                                                                                                                                                                       
                 cmp al,'2'
                 je E2nmp    ;call 2nd price
                 cmp al,'3'
                 je E2b   ;back to main
                 call Event2

                 E2mp:
                       call E2_mp
                 E2nmp:
                       call E2_nmp
                 E2b:
                       call E2_b

                 E2_mp:                   ;role
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h                ;rply role
                         lea dx, line02a
                         int 21h
                                mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price02a

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply


                               BackE2:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE2    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE2   ;back
                                        call BackE2
                                        
                                        StayE2:
                                             call Event2
                                        BMainE2:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah, 4ch
                         int 21h
                 E2_nmp:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line02b
                         int 21h

                             mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price02b

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply

                               BackE2a:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE2a    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE2b   ;back
                                        call BackE2a
                                        
                                        StayE2a:
                                             call Event2
                                        BMainE2b:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah,09h   ;reply
                         int 21h
                         mov ah, 4ch
                         int 21h
                 E2_b:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line
                         int 21h                       
                         call main
                         int 21h
                        
        mov ah, 4ch
        int 21h


  Event3:
        mov ax, @data
        mov ds, ax
        mov ah, 09h
        lea dx, crlf
        int 21h
        lea dx, line
        int 21h
        lea dx, crlf
        int 21h
        lea dx, line03
        int 21h
        mov ah, 01h
        int 21h
 
                 cmp al,'1'
                 je E3mp    ;call 1st price                                                                                                                                                                                                                                                       
                 cmp al,'2'
                 je E3nmp    ;call 2nd price
                 cmp al,'3'
                 je E3b   ;back to main
                 call Event3

                 E3mp:
                       call E3_mp
                 E3nmp:
                       call E3_nmp
                 E3b:
                       call E3_b

                 E3_mp:                   ;role
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h                ;rply role
                         lea dx, line03a
                         int 21h
                                mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price03a

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply


                               BackE3:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE3    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE3   ;back
                                        call BackE3
                                        
                                        StayE3:
                                             call Event3
                                        BMainE3:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah, 4ch
                         int 21h
                 E3_nmp:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line03b
                         int 21h

                             mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price03b

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply

                               BackE3a:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE3a    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE3b   ;back
                                        call BackE3a
                                        
                                        StayE3a:
                                             call Event3
                                        BMainE3b:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah,09h   ;reply
                         int 21h
                         mov ah, 4ch
                         int 21h
                 E3_b:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line
                         int 21h                       
                         call main
                         int 21h
                        
        mov ah, 4ch
        int 21h


Event4:
        mov ax, @data
        mov ds, ax
        mov ah, 09h
        lea dx, crlf
        int 21h
        lea dx, line
        int 21h
        lea dx, crlf
        int 21h
        lea dx, line04
        int 21h
        mov ah, 01h
        int 21h
 
                 cmp al,'1'
                 je E4mp    ;call 1st price                                                                                                                                                                                                                                                       
                 cmp al,'2'
                 je E4nmp    ;call 2nd price
                 cmp al,'3'
                 je E4b   ;back to main
                 call Event4

                 E4mp:
                       call E4_mp
                 E4nmp:
                       call E4_nmp
                 E4b:
                       call E4_b

                 E4_mp:                   ;role
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h                ;rply role
                         lea dx, line04a
                         int 21h
                                mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price04a

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply


                               BackE4:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE4    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE4   ;back
                                        call BackE4
                                        
                                        StayE4:
                                             call Event4
                                        BMainE4:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah, 4ch
                         int 21h
                 E4_nmp:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line04b
                         int 21h

                             mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price04b

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply

                               BackE4a:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE4a    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE4b   ;back
                                        call BackE4a
                                        
                                        StayE4a:
                                             call Event4
                                        BMainE4b:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah,09h   ;reply
                         int 21h
                         mov ah, 4ch
                         int 21h
                 E4_b:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line
                         int 21h                       
                         call main
                         int 21h
                        
        mov ah, 4ch
        int 21h



Event5:
        mov ax, @data
        mov ds, ax
        mov ah, 09h
        lea dx, crlf
        int 21h
        lea dx, line
        int 21h
        lea dx, crlf
        int 21h
        lea dx, line05
        int 21h
        mov ah, 01h
        int 21h
 
                 cmp al,'1'
                 je E5mp    ;call 1st price                                                                                                                                                                                                                                                       
                 cmp al,'2'
                 je E5nmp    ;call 2nd price
                 cmp al,'3'
                 je E5b   ;back to main
                 call Event5

                 E5mp:
                       call E5_mp
                 E5nmp:
                       call E5_nmp
                 E5b:
                       call E5_b

                 E5_mp:                   ;role
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h                ;rply role
                         lea dx, line05a
                         int 21h
                                mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price05a

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply


                               BackE5:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE5    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE5a   ;back
                                        call BackE5
                                        
                                        StayE5:
                                             call Event5
                                        BMainE5a:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah, 4ch
                         int 21h
                 E5_nmp:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line05b
                         int 21h

                             mov ax,@data              ;start multiply
                                mov ds,ax
                                mov bl,2

                                lea dx,pm1
                                mov ah,9    ;rply
                                int 21h

                                mov ah,1
                                int 21h
                                sub al,30h
                                mov ntik,al

                                mul price05b

                                mov total,al
                                aam

                                add ah,30h
                                add al,30h

                                mov bx,ax

                                lea dx,pm2
                                mov ah,9
                                int 21h
                                
                                mov ah,2    ;1st digit
                                mov dl,bh   
                                int 21h

                                mov ah,2    ;2nd digit
                                mov dl,bl
                                int 21h     ;end multiply

                               BackE5a:
                                    mov ah, 09h ;design
                                    lea dx, crlf
                                    int 21h  
                                    lea dx, dot
                                    int 21h 
                                    lea dx, crlf
                                    int 21h  

                                    mov ah,09h                                                                                                                                      
                                    lea dx, line07
                                    int 21h
                                    mov ah,01h          ;reply                                                                    
                                    int 21h
                                        cmp al,'1'
                                            je StayE5a    ;stay                                                                                                                                                                                                                                                     
                                        cmp al,'2'
                                            je BMainE5b   ;back
                                        call BackE5a
                                        
                                        StayE5a:
                                             call Event5
                                        BMainE5b:
                                             call main

                                                                   
                                    mov ah, 09h
                                    mov ah,4ch
                                    int 21h                  

                         mov ah,09h   ;reply
                         int 21h
                         mov ah, 4ch
                         int 21h
                 E5_b:
                         mov ax, @data
                         mov ds, ax
                         mov ah, 09h
                         lea dx, line
                         int 21h                       
                         call main
                         int 21h
                        
        mov ah, 4ch
        int 21h

Event6: 
        mov ax, @data
        mov ds, ax
        mov ah, 09h
        lea dx, crlf
        int 21h
        mov ah, 09h
        lea dx, crlf
        int 21h
        mov ah, 09h
        lea dx, crlf
        int 21h
        mov ah,09h
        lea dx, line06
        int 21h

        mov ah,4ch
        int 21h

main endp
end main
