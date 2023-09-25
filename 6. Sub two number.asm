; Sub two numbers

.model small
.stack 100h
.data

.code
    main proc
           mov bl, 7  ; bl, cl are general purpose register
           mov cl, 5
           SUB bl, cl ; result will be in "bl" and it is in ASCII code
           
           ; convert ASCII code in "bl" to number
           ; 0 -> 48, 1 -> 49 ...
           ; so we have to add 48 to result
           ADD bl, 48
           
           ; Display result
           mov dl, bl  
           mov ah, 2
           int 21h
           
           ; return to DOS mode
           mov ah, 4ch
           int 21h
           
    main endp
end main