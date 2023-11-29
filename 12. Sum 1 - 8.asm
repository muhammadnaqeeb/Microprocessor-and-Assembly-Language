.model small
.stack 100h
.code
    main proc 
        mov cx, 8
        mov ax, 0
        mov bx, 1
       
        
        repeat:
            add ax, bx
            inc bx
               
        loop repeat
        
        ;Display the result
        
        
        
        mov ah, 4ch
        int 21h
                
        
    main endp
end main