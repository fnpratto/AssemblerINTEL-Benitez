;9.	Dada una matriz de 5x5, determinar si dicha matriz es triangular superior y/o inferior e imprimir el resultado por pantalla.


%macro mPuts 0
    sub     rsp,8
    call    puts
    add     rsp,8
%endmacro

%macro mGets 0
    sub     rsp,8
    call    gets
    add    rsp,8
%endmacro

%macro mPrintf 0
    sub     rsp,8
    call    printf
    add     rsp,8
%endmacro

global main
extern puts
extern gets
extern printf

section .data
    matriz dq 1, 2, 3, 4, 5
           dq 0, 1, 2, 3, 4
           dq 0, 0, 1, 2, 3
           dq 0, 0, 0, 1, 2
           dq 0, 0, 0, 0, 1
    mensajeSup db 'La matriz es triangular superior', 0
    mensajeInf db 'La matriz es triangular inferior', 0
    mensajeNoTriangular db 'La matriz no es triangular', 0
    longFila     dq 40
    longElemento dq 8
    numeroFilas  dq 5
    contadorFil  dq 0
    contadorCol  dq 0
    contColLocal  dq 0


section .bss
    esTriangularSup resb 1
    esTriangularInf resb 1

section     .text
main:
    mov byte [esTriangularSup], 1 ; seteo trye 
    mov byte [esTriangularInf], 1

comprobarTriangularSuperior:
    mov rdx, [contadorFil]         ; contador de columnas = número de fila
    mov rsi, matriz     

    mov rax, [contColLocal] ; cantidad de col a chequear por cada fil
    inc rax, [numeroFilas] ; +5
    dec rax, [contadorFil] ; - fila en la que esta
    mov [contadorCol], rax

comprobarFilaSuperior:
    cmp rdx, [contadorCol],; comparo 
    jge siguienteFilaSuperior
    mov rax, [rsi + rdx*8]
    cmp rax, 0
    jne noEsTriangularSuperior
    add rdx, 1
    mov [contadorFil], rdx
    jmp comprobarFilaSuperior

noEsTriangularSuperior:
    mov byte [esTriangularSup], 0
    jmp comprobarTriangularInferior

siguienteFilaSuperior:
    add rsi, [longFila]
    mov rbx, [contadorCol] 
    add rbx, 1
    mov [contadorCol], rbx
    cmp rbx, [numeroFilas]
    jl comprobarTriangularSuperior
    mov rdi, msjSup
    mPuts
    jmp fin


comprobarTriangularInferior:


    ; Comprobar si es triangular inferior
    mov ecx, 5           ; número de filas
    mov esi, matriz      ; puntero a la matriz
    mov ebx, 0           ; contador de filas

comprobarTriangularInferior:
    mov rax,rbx
    imul 4
    mov ebx, rax
    add esi, ebx       ; puntero a la diagonal actual
    mov edx, 0           ; contador de columnas
comprobarFilaInferior:
    cmp edx, ebx
    jge siguienteFilaInferior
    mov eax, [esi + edx*4]
    cmp eax, 0
    jne noEsTriangularInferior
    add edx, 1
    jmp comprobarFilaInferior

noEsTriangularInferior:
    mov byte [esTriangularInf], 0

siguienteFilaInferior:
    ; 20 - (ebx+1)*4
    mov rax, ebx
    inc rax, 1
    imul 4
    mov rdi, 20
    dec rdi, rax

    add esi, rdi
    add ebx, 1
    cmp ebx, 5
    jl comprobarTriangularInferior

    ; Imprimir el resultado
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor 1 (stdout)

    ; Imprimir si es triangular superior
    mov al, [esTriangularSup]
    cmp al, 1
    jne comprobarInferior
    mov ecx, mensajeSup
    mov edx, 30
    int 0x80

comprobarInferior:
    ; Imprimir si es triangular inferior
    mov al, [esTriangularInf]
    cmp al, 1
    jne noTriangular
    mov ecx, mensajeInf
    mov edx, 30
    int 0x80
    jmp fin

noTriangular:
    ; Imprimir que no es triangular
    mov ecx, mensajeNoTriangular
    mov edx, 28
    int 0x80

fin:
    ; Exit
    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80