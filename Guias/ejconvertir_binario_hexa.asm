section .data
    binary_string db "1001001100110101", 0  ; Null-terminated string
    print_format db "Numbers: %d %d %d %d", 10, 0


section .bss 
    numbers resb 4                          ; Array to store the four numbers

section .text
global main
extern printf

main:
    ; Load the address of the binary string
    lea rsi, [binary_string]
    
    ; Initialize the index and loop counter
    xor rdi, rdi  ; Index for the numbers array
    mov rcx, 4    ; We need to process 4 groups

process_group:
    ; Initialize the current number to 0
    xor rax, rax

    ; Process 4 characters
    mov rbx, 4
convert_loop:
    lodsb         ; Load next byte from string into AL
    cmp al, '1'
    je is_one
    cmp al, '0'
    je is_zero
    ; If it's not '1' or '0', something went wrong
    jmp error

is_one:
    shl al, 1
    or  al, 1
    shl rax, 1
    jmp continue

is_zero:
    shl rax, 1
    jmp continue

continue:
    dec rbx
    jnz convert_loop

    ; Store the result in the numbers array
    mov [numbers + rdi], al
    inc rdi  ; Move to the next element in the numbers array
    loop process_group

    ; Print the results
    lea rdi, [print_format]
    movzx rsi, byte [numbers]
    movzx rdx, byte [numbers + 1]
    movzx rcx, byte [numbers + 2]
    movzx r8, byte [numbers + 3]
    xor rax, rax  ; printf uses rax to determine the number of SSE registers used
    call printf

    ; Exit the program
    ret

error:

    ret
