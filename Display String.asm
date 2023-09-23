;Display Message

.model small
.stack 100h    ; This line reserves a stack of 256 bytes (100h in hexadecimal) 
.data
        Msg db "Hello World!$"
        

.code
        main proc 
                mov ax ,@data      ;you cannot move data from one segment to other directly
                mov ds,ax          ;you have to include general purpose register
                
                ; display string    
                lea dx, Msg        ;Load Effective Address ; LEA destination, source
                mov ah, 9
                int 21h  
                         
                ; return to DOS node, nothing to do with displaying string
                mov ah, 4ch
                int 21h
              
        
        main endp   
        end main
