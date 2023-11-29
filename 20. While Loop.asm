; Write some code to count the number of charaters 
; input line.

; initialize count to 0 
; read a character 
; WHILE character <> carriage_return DO 
; count = count + l 
; read a character 

  
.model small
.stack 100h 
.data
.code
    main proc 
        mov dx, 0
        mov ah, 1
        int 21h
        
        while: 
            cmp al, 0DH
            JE end_while
            inc dx
            int 21h
            jmp while  
           
       end_while: 
        
    main endp
end main