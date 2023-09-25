; input two number and add them

.model small
.stack 100h
.data  

.code
    main proc 
        ;input first number
        ;user input goes to "al" 
        mov ah, 1
        int 21h
    
        ;save first input,
        ;otherwise value will be override
        mov bl, al
    
        ;input second number
        mov ah, 1
        int 21h
    
        ;add two numbers
        add bl, al
        
        ;as we added two ASCII code,
        ;so we have to sub 48
        sub bl, 48 
        
        ;display
        mov dl, bl
        mov ah, 2
        int 21h
        
        mov ah, 4ch
        int 21h
    
    main endp
end main
    
               