; A READ procedure that lets the user enter a binary number and stores it in AX.
.model small
.stack 100h 
.data
.code
    main proc  
           
         XOR AX,AX  ; clear BX
	     MOV AH,1     ; input char function
	     INT 21h         ; Read a character
	     while:
		   CMP AL,0Dh     ;CR?
		   JE endwhile        ;yes, done
		   AND AL,0Fh      ;no, convert to binary
		   SHL BX,1            ;make room for new value
		   OR BL,AL            ;put value into BX
		   INT 21h               ;read a character
		   JMP while         ;loop back
	     endwhile:

        
    main endp
end main
