.model small
.stack 100h  
.code   
    main proc  
         ; Display Char 
         mov dl, 'C'
         mov ah, 2
         int 21h  
             
             
         ;Return to DOS mode
         mov ah, 4ch
         int 21h
    main endp
    end main

   
    