.model small
.stack 100h
.code
    main proc 
        mov cx, 256
        mov dl, 0h
        
        repeat:
            mov ah, 2
            int 21h
            inc dl 
            
        loop repeat
        
        mov ah, 4ch
        int 21h
                
        
    main endp
end main