; Replace.the number in AX by its absolute value. 
; Solution: A pseudoc~e algorithm Is · 
; IF AX < 0 
; THEN 
; replace AX by -AX 
; END_IF    

.model small
.stack 100h 
.data
.code
    main proc
        cmp ax, 0
        JNL endif
        neg ax
        
        endif: 
        mov ah, 4ch
        int 21h
   
        
    main endp
end main