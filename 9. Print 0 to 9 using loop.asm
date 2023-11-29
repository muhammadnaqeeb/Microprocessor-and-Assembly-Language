.model small
.stack 100h
.data
.code
    main proc
        mov cx, 10
        mov bl, 30h ;30h = 48  ; you can use both
        mov ah, 2
        
        repeat:
            
            mov dl, bl
            int 21h
            inc bl  
            
            mov dl, 20h
            
            int 21h 

        loop repeat 
    main endp
    
end main
    