; Read a character. If it's "y" or "Y", display it; otherwise, 
; terminate the program.

.model small
.stack 100h 
.data
.code
    main proc  
             
         MOV AH, 1 ;
         INT 21H  
 
         CMP AL, 'y'  
         JE display
           
         CMP AL, 'Y'  
         JE display
         
         JMP else
         
         display:   
             mov dl, al
             mov ah, 2
             int 21h
             JMP end
         
         else:
             mov ah, 4ch
             int 21h     
             
         end:       
                     
       
    main endp
end main