.model small
.stack 100h
.data
.code
    main proc  
        mov cx,, 26
        mov dl, 41h ; 65 = 41h (can use both)
        repeat:
            mov ah, 2
            int 21h
            inc dl 
            
        loop repeat 
        
        
        mov ah, 4ch
        int 21h
    
    main endp
    
end main