; Read a character, and if it's an uppercase letter, display it.
; Read a character (into AL) 
; IF ('A' <= character) and (character <= 'Z') 
; )HEN 
; display character 

.model small
.stack 100h 
.data
.code
    main proc 
        ; read input 
        mov ah, 1
        int 21h
        
        cmp al, 'A'
        JNGE end
        cmp al, 'Z'
        JNLE end  
        
        ; then display char
        mov dl, al
        mov ah, 2
        int 21h      
       
               
        end:      
               
    main endp
end main