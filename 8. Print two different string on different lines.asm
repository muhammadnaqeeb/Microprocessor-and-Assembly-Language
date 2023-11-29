.model small
.stack 100h
.data
    Msg1 DB "Hello $"
    Msg2 DB "World $"
.code   
    Main proc
        Mov ax, @Data
        Mov ds, ax
    
        lea dx, Msg1 ; or Mov dx, offset Msg1
        Mov ah, 9
        int 21h   
        
        ;Next word on next line
        ;new line feed: 10  or 0Ah
        ;carriage return: 13 or 0Dh
        
        ;line feed
        Mov dx, 0Ah
        Mov ah, 2
        int 21h 
        
        ;carriage return
        Mov dx, 0Dh
        Mov ah, 2
        int 21h 
        
        
    
        lea dx, Msg2
        Mov ah, 9
        int 21h 
        
        Mov ah, 4ch
        int 21h
        
    Main endp
End Main
    
    
    