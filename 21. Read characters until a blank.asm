; Write some code to read characters until a blank is read.
.model small
.stack 100h 
.data
.code
    main proc  
           
        mov ah, 1
        
        repeat:
            int 21h
            cmp al, ' '
            JNE repeat
     
    main endp
end main