; IF AL <= BL 
; THEN 
; Display the character in AL 
; ELSE 
; display the character in BL 
; END_IF

.model small
.stack 100h 
.data
.code
    main proc
        mov al, '2' ; for checking
        mov bl, '3' ; for checking
        
        mov ah, 2
        cmp al, bl
        jnbe else   
        mov dl, al
        jmp display
        
        
        
        else:
            mov dl, bl
            
        display:
            int 21h
           
        
    main endp
end main