
.model small
.stack 100h
.data  
    result DW 0
   
.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        mov ax, 1
        mov cx, 0
        
        add_loop:
            add result, ax
            add ax, 4
            inc cx
            cmp ax, 51
            JL add_loop
        
        lea dx, result
        mov ah, 9
        int 21h
              
    main endp
end main 