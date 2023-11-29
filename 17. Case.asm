; If AX contains a negative number, put -1 In BX; if AX 
; contains 0, put O in BX; if AX contains a positive number, put 1 In BX.
       

; CASE AX 
; <0: put -1 in BX 
; =0: put o in BX 
; >O: put l in BX 
; END_CASE
       
.model small
.stack 100h
.code
    main proc  
         
        mov ax, 0 
        ; case ax
        cmp ax, 0
        JL Negative ; ax < 0
        JE Zero     ; ax = 0
        JG Posiive  ; ax > 0
        
        Negative: 
            mov bx, -1
            JMP end_case
            
        Zero:
            mov bx, 0
            JMP end_case
            
        Posiive:
            mov bx, 1
            JMP end_case 
            
       end_case:
            
  
    
    main endp
end main