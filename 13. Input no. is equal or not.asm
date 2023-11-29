.model small
.stack 100h
.data
    trueMsg DB "Numbers are equal $"
    falseMsg DB "Numbers are not equal $"
    
.code
    main proc
        
        mov ax, @data
        mov ds, ax
         
        mov bl, '6'
        
        ;input a number
        mov ah, 1 ; input will be in al
        int 21h
        
        CMP al, bl
        JE true
        
        mov dx, offset falseMsg
        mov ah, 9
        int 21h
        mov ah, 4ch
        int 21h
        
         
        true:
            mov dx, offset trueMsg
            mov ah, 9
            int 21h
            
        mov ah, 4ch
        int 21h                
        
    main endp
end main