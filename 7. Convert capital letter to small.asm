;convert capital letter to small
.model small
.stack 100h
.data
.code
    main proc 
        ;input character
        mov ah,1
        int 21h
        
        ;convert 
        ;A -> 65
        ;B -> 66
        ;a -> 97
        ;b -> 98
        ;Difference b/w them is 32
        ;so we have to add or sub accordingly
        
        add al, 32
        
        ;Display
        mov dl, al
        mov ah, 2
        int 21h 
        
        ;return to DOS
        mov ah, 4ch
        int 21h
              
    main endp
end main