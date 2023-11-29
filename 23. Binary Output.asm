.model small
.stack 100h 
.data
.code
    main proc  
          MOV CX, 16
          MOV  AH, 2
          ;mov bx, '5'
          
          Repeat:    
            
            ROL BX, 1
            JNC  else
            if:
               MOV DL, 1
               INT   21h
               JMP end
            else:
               MOV DL, 0
               INT 21h
            
            end:

            Loop Repeat
        
    main endp
end main









