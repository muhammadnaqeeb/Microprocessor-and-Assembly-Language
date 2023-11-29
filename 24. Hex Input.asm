
.model small
.stack 100h 
.data
.code
    main proc  
           
         XOR BX,BX
         MOV CL,4
         MOV AH,1
         INT 21H
         WHILE:
	       CMP AL,0DH
	       JE END_WHILE
	       CMP AL,39H
	       JG LETTER
	       AND AL,0FH ; convert character to binary
	       JMP SHIFT
           LETTER:
	        SUB AL,37H
           Shift:
	        SHL BX,CL ; making space (shifting)
	        OR BL,AL  ; inserting value
	        INT 21H
	        JMP WHILE
          END_WHILE:
  
        
    main endp
end main




