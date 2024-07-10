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
    matriz1 dq 1, 2, 3, 4, 5
            dq 0, 1, 2, 3, 4
            dq 0, 0, 1, 2, 3
            dq 0, 0, 0, 1, 2
            dq 0, 0, 0, 0, 1 ; sup

    matriz2 dq 0, 0, 0, 0, 0
            dq 0, 0, 0, 0, 0
            dq 0, 0, 0, 0, 0
            dq 0, 0, 0, 0, 0
            dq 0, 0, 0, 0, 0  ; las dos

    matriz3 dq 1, 0, 0, 0, 0
            dq 1, 1, 0, 0, 0
            dq 1, 1, 1, 0, 0
            dq 1, 1, 1, 1, 0
            dq 1, 1, 1, 1, 1 ; inferior 

    mensajeSup db 'La matriz es triangular superior', 0
    mensajeNoSup db 'La matriz NO es triangular superior', 0
    mensajeInf db 'La matriz es triangular inferior', 0
    mensajeNoInf  db 'La matriz NO es triangular inferior', 0
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
comprobarTriangularInferior:
    mov rsi, matriz3  
    add rsi, [contadorFil] 
    inc rsi

    mov qword[contColLocal] ,0
    mov rax, [contColLocal] ; cantidad de col a chequear por cada fil
    add rax, [numeroFilas] ; +5
    sub rax, [contadorFil] ; - fila en la que esta
    dec rax
    mov [contColLocal], rax

comprobarFilaInferior:
    mov rdx, [contadorCol]   
    cmp rdx, [contColLocal],
    jge siguienteFilaInferior
    mov rax, [rsi + rdx*8]
    cmp rax, 0
    jne noEsTriangularInferior
    add rdx, 1
    mov [contadorCol], rdx
    jmp comprobarFilaInferior

noEsTriangularInferior:
    mov rdi, mensajeNoInf
    mPuts
    jmp resetVariables

siguienteFilaInferior:
    mov rbx, [contadorFil] 
    add rbx, 1
    mov [contadorFil], rbx
    cmp rbx, [numeroFilas]
    jl comprobarTriangularInferior
    mov rdi, mensajeInf
    mPuts
;;;;;;;;
resetVariables:
    mov qword[contadorFil] ,0
    mov qword[contColLocal] ,0
    mov qword[contadorCol] ,0

comprobarTriangularSuperior:
    mov rsi, matriz3 

    mov qword[contColLocal] ,0
    mov rax, qword[contColLocal]
    add rax, [contadorFil] ; 
    mov [contColLocal], rax

comprobarFilaSuperior:
    mov rdx, [contadorCol]   
    cmp rdx, [contColLocal],
    jge siguienteFilaSuperior
    mov rax, [rsi + rdx*8]
    cmp rax, 0
    jne noEsTriangularSuperior
    add rdx, 1
    mov [contadorCol], rdx
    jmp comprobarFilaSuperior

noEsTriangularSuperior:
    mov rdi, mensajeNoSup
    mPuts
    jmp fin

siguienteFilaSuperior:
    mov rbx, [contadorFil] 
    add rbx, 1
    mov [contadorFil], rbx
    cmp rbx, [numeroFilas]
    jl comprobarTriangularSuperior
    mov rdi, mensajeSup
    mPuts

fin:
    ret