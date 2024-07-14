;16.	Se tiene el campo NUM que corresponde a un número almacenado 
;como BPF c/s16 bits en memoria. Se pide realizar un programa necesario 
;para rebatir los bits que componen al número e imprimir el número en configuración 
;binaria por pantalla. (Rebatir significa poner el 1er. bit del número en el lugar 
;del último, el 2do. en el anteúltimo y así sucesivamente)

section .data
    NUM dw 0b1001001100110101  ; Example 16-bit number
    format db "Reversed bits: %s", 10, 0
    buffer db 17 dup(0)  ; Buffer to store binary string (16 bits + null terminator)

section .bss

section .text
global main
extern printf

%macro mPrintf 1
    sub rsp, 8
    mov rdi, %1
    mov rax, 0
    call printf
    add rsp, 8
%endmacro

main:
    ; Load the 16-bit number
    mov ax, [NUM]

    ; Reverse the bits
    mov cx, 16
    xor bx, bx  ; Clear bx to store the reversed bits

reverse_bits:
    shl ax, 1  ; Shift left to get the MSB
    rcl bx, 1  ; Rotate carry left into bx (reverse the bit order)
    loop reverse_bits

    ; Convert the reversed bits to a binary string
    mov cx, 16
    lea rdi, [buffer]

convert_to_binary:
    shl bx, 1  ; Shift left to get the MSB
    adc byte [rdi], '0'  ; Add '0' + carry (0 or 1) to create '0' or '1'
    inc rdi  ; Move to the next character in the buffer
    loop convert_to_binary

    ; Null-terminate the string
    mov byte [rdi], 0

    ; Print the binary string
    lea rdi, [format]
    lea rsi, [buffer]
    mPrintf rdi

    ; Exit the program
    mov eax, 0
    ret
