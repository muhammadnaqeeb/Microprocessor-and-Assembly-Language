


# Install
- DOSB
- AssmSoft
# Running Assemble code (Way 1)
- Go to AssmSoft folder make .asm file

![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/001.png)

- Open DOSBOX
- Run Following command

``` 
mount c c:/assmsoft 
```

In place of first “c” you can give any name, to access it latter on

``` 
c: 
```

``` 
nasm hello.asm -o hello.com -l hello.lst 
```

``` 
afd hello.com 
```

hello is my file name.

![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/002.png)

To execute your code one by one use “f1” key

If you don’t want to open this screen then only type the file name

``` hello ```

# Running Assemble code (Way 2)
Download emu8086 simulator

# Register and function number
### **Display String**
String move to dx (function number 9)
### **Display Char**
Char move to dl (function number 2)
### **Input Char from user**
al will contain the input char (Function number 1)

al register will contain ASCII code of input key
### **Input and output**
ah register is used for input and output

User input will be store in “al” register and it is in ACSII form
### **ASCII code to number**
```
0 -> 48, 

1 -> 49 …
```
So we have to add 48 to get number
### **Capital and small letter ASCII code**
```
A -> 65

B -> 66

a -> 97

b -> 98
```
Difference b/w them is 32

so we have to add or sub accordingly




# Print message on screen
```
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

```

- **.stack 100h:** This line reserves a stack of 256 bytes (100h in hexadecimal) for the program. The stack is used for temporary storage of data and return addresses during function calls.
- **.data:** In data section you can declare variables and constants. 
- **.code:** This section defines the code segment of the program, where you write the actual assembly instructions.
- **main proc:** This line declares the start of the main procedure (main function) of the program.
- **mov ax, @data:** This instruction moves the address of the data segment (denoted by @data) into the AX register. The data segment contains the variable "Msg."
- **mov ds, ax:** This instruction moves the value in the AX register (which now holds the address of the data segment) into the DS (Data Segment) register. This is necessary because most memory accesses in x86 assembly are relative to the DS segment, so you need to set DS to point to your data.
- **lea dx, Msg:** This instruction loads the effective address (lea) of the "Msg" variable (the address of the string) into the DX register. DX is used as a pointer to the string.
- **mov ah, 9:** This sets the AH (high byte of AX) register to 9, which is the DOS function code for displaying a string.

- **int 21h:** This instruction generates a software interrupt (interrupt 21h) to invoke the DOS service routine for displaying the string.
- **mov ah, 4Ch:** This sets the AH register to 4Ch, which is the DOS function code for program termination.


# Display Char
```
.model small
.stack 100h  
.code   

    main proc  
         ; Display Char 
         mov dl, 'C'
         mov ah, 2
         int 21h  

         ;Return to DOS mode
         mov ah, 4ch
         int 21h
    main endp
    end main
```

# Input char from user
```
; Program to input a character from user and print it

.model small
.stack 100h 
.data
.code
    main proc  

        ; input a single char
        mov ah, 1
        int 21h

        ; display that char
        mov dl, al
        mov ah, 2
        int 21h

        mov ah, 4ch
        int 21h

    main endp
end main   
```

- **mov ah, 1:** This instruction sets the value of the ah (accumulator high) register to 1. In DOS interrupts, setting ah to 1 indicates that you want to read a character from standard input (keyboard).
- **mov dl, al:** This instruction copies the value from the al register (where the character input is stored) to the dl (data low) register.

# Add two numbers

```
; Add two numbers

.model small
.stack 100h
.dat
.code

    main proc
           mov bl, 3  ; bl, cl are general purpose register
           mov cl, 2
           ADD bl, cl ; result will be in "bl" and it is in ASCII code

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
```

- **bl** and **cl** are  general-purpose 8-bit register.
- **mov dl, bl:** This instruction moves the value from bl (which now holds the numeric result) to the dl register. dl is used to store the character to be displayed.
- **mov ah, 2:** This instruction sets the value of the ah register to 2, indicating that we want to display a character on the screen.
- **ADD bl, 48:** This instruction adds 48 to the value in **bl**. This step is necessary because the result in **bl** is in ASCII code, and you want to convert it to its numeric representation. In ASCII, the character '0' is represented by 48, '1' by 49, and so on.
- After the addition **ADD bl, cl**, the result of the addition (which is 5 in this case) is stored in the bl register. However, this value is still in its numeric form, not its ASCII character form.
- To display the result as an ASCII character on the screen, you need to convert the numeric value to its ASCII representation. To do this, you add 48 to the numeric value. This addition effectively shifts the numeric value to the corresponding ASCII character value. For example, adding 48 to 5 results in 53, which is the ASCII code for the character '5'.

# Input two numbers and Add
```
; input two number and add them
.model small
.stack 100h
.data  
.code

    main proc 
        ;input first number
        ;user input goes to "al" 
        mov ah, 1
        int 21h

        ;save first input,
        ;otherwise value will be override
        mov bl, al

        ;input second number
        mov ah, 1
        int 21h

        ;add two numbers

        add bl, al

        ;as we added two ASCII code,

        ;so we have to sub 48
        sub bl, 48 

        ;display
        mov dl, bl
        mov ah, 2
        int 21h

        mov ah, 4ch
        int 21h

    main endp
end main
```

# Program to convert capital letter to small letter
```
;convert capital letter to small

.model small
.stack 100h
.data
.code

    main proc 
        ;input character
        mov ah,1
        int 21h

        ;convert 

        ;A -> 65
        ;B -> 66
        ;a -> 97
        ;b -> 98
        ;Difference b/w them is 32
        ;so we have to add or sub accordingly

        add al, 32

        ;Display
        mov dl, al
        mov ah, 2
        int 21h 

        ;return to DOS
       `mov ah, 4ch
        int 21h

    main endp
end main   
```

- **add al, 32:** This instruction adds 32 to the value in the al register. In **ASCII, the difference between uppercase and lowercase letters is 32**. So, adding 32 effectively converts an uppercase character to its lowercase counterpart. For example, 'A' (65 in ASCII) becomes 'a' (97 in ASCII).

# Variable, Data type, Offset and LEA
![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/004.png)

# Two String on Two different line
```
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
```

![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/005.png)


# Loop, Label, Counter Register, Inc and Program to print 0 to 9
![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/006.png)

```
.model small
.stack 100h
.data
.code

    main proc
        mov cx, 10
        mov dl, 30h ;30h = 48  ; you can use both

        repeat:
            mov ah, 2
            int 21h
            inc dl
        loop repeat 
   main endp

end main
```

# Print A to Z using loop
```
.model small
.stack 100h
.data
.code

    main proc  
        mov cx,, 26
        mov dl, 41h ; 65 = 41h (can use both)
        repeat:
            mov ah, 2
            int 21h
            inc dl 
        loop repeat 

        mov ah, 4ch
        int 21h

    main endp

end main
```

# Print ASCII code
```
.model small
.stack 100h
.code

    main proc 
        mov cx, 256
        mov dl, 0h

        repeat:
            mov ah, 2
            int 21h
            inc dl 

        loop repeat


        mov ah, 4ch
        int 21h


    main endp

end main
```
# Flag Register
![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/007.png)



# Jump, unconditional jump, conditional jump and Compare
![](https://github.com/muhammadnaqeeb/Microprocessor-and-Assembly-Language/blob/main/images/008.png)

# Check if input number is equal to given number
```
.model small
.stack 100h
.data
    trueMsg DB "Numbers are equal $"
    falseMsg DB "Numbers are not equal $"


.code

    main proc


        mov ax, @data

        mov ds, ax


       `mov bl, '6'
        ;input a number
        mov ah, 1 ; input will be in al
        int 21h


        CMP al, bl
        JE true

        mov dx, offset falseMsg
        mov ah, 9
        int 21h
        mov ah, 4ch
        int 21h


        true:
            mov dx, offset trueMsg
            mov ah, 9
            int 21h

        mov ah, 4ch
        int 21h                

    main endp
end main

```

