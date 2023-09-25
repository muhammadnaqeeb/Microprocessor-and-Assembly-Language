; Program to input a character from user and print it
.model small
.stack 100h 
.data
.code
    main proc  
           
        ; input a single char
        mov ah, 1
        int 21h
             
        ; display that char
        mov dl, al
        mov ah, 2
        int 21h
        
           
        mov ah, 4ch
        int 21h
        
    main endp
    end main