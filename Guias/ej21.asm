;21.Se cuenta con un archivo en formato binario llamado ENCUESTA.DAT que 
;contiene información de las respuestas de una encuesta.  La encuesta consultaba a que candidato votaría
; (de una lista de 4 opciones) 
;y se realizó en 10 ciudades.
;Cada registro del archivo representa una respuesta y contiene la siguiente información:
;•	Código de candidato: 2 bytes en formato ASCII (AF, MM, RL, SM)
;•	Código de ciudad: 1 bytes en formato binario punto fijo sin signo 
;Se pide realizar un programa en assembler Intel x86 que lea el archivo y 
;por cada registro llene una matriz (M) de 4x10 donde cada fila representa a un candidato y 
;cada columna una ciudad.  Cada elemento de la matriz M representa la sumatoria de respuestas para
; cada candidato en cada ciudad; para el llenado de M se hará uso de una rutina interna VALREG q validará 
;los datos de cada registro descartando los incorrectos. 



;Por último el programa debe pedir ingresar un código de candidato e informar por pantalla en que ciudad 
;tiene menos intención de votos teniendo en cuenta que habrá un vector en memoria de longitud 10, 
;cuyos elementos tienen 20 bytes de longitud con los nombres de las ciudades.


%define CANDIDATO1 "AF"
extern fopen, fclose, fread, printf, atoi
global main

 section .data
    archivo db "ENCUESTA.DAT",0
    modo db "r",0
    M times 4 times 10 dq 0
    msgError db "error",0
    msgValido db "valido",10,0
    msgNoValido db "No valido",10,0
    formato_linea db "candidato %s, cuidad %i",10,0
    auxCandidato db "**",0
    candidatosValidos db "AF","MM","RL","SM"
    lengh_fila dd 40 ; 10col * 4bytes de num
    lengh_elemento dd 4
    menos_votantes db "AF"
    cantidad_menos_votantes db 200
    formato_vector db "Vector Candidatos: ",10,0
    formato_elemento db "%c%c",0
    formato_matrix db "Matrix:",10,0
    formato_celda db "%d ",0
    aux_vector_candidatos db "********************************************************************************************************************************************************************************************************",0

 section .bss
    id resq 1
    vector_candidatos times 10 resb 20
    
    registro:
        candidato resw 1
        cuidad resb 1
        espacio resb 1
    
    auxCuidad resd 1
    int_cantidado resq 1


 section .text

 main:
    lea rdi, [archivo]
    mov rsi, modo

    sub rsp,8
    call fopen
    add rsp,8

    cmp rax, 0
    je error_open

    mov qword[id], rax

leer_registro:
    mov rdi, registro
    mov rsi, 4
    mov rdx, 1
    mov rcx, [id]

    sub rsp,8
    call fread
    add rsp,8

    cmp     rax, 0
    jle     close_file

VALREG:

    mov     rcx, 2
    mov     rsi, candidato
    mov     rdi, auxCandidato
    rep movsb


    lea rdi, [cuidad]
    sub rsp, 8
    call atoi
    add rsp, 8
    mov [auxCuidad],rax


    mov rdi, formato_linea
    mov rsi, auxCandidato
    mov edx, [auxCuidad]
    
    sub rsp,8
    call printf
    add rsp,8

    xor rax,rax
valido_cuidad:
    mov eax , dword[auxCuidad]
    cmp eax, 0
    jle siguiente_registro
    cmp eax, 10
    jg siguiente_registro

valido_cantidado:
    xor rax,rax
    mov rdi,0
    lea rdx, [candidatosValidos]

    loop:
        movzx rax, word [rdx+rdi*2] 
        cmp ax, word [auxCandidato]
        je registro_valido
        add rdi,1
    
    cmp rdi, 3
    jle loop
    jmp siguiente_registro

registro_valido:
    mov dword[int_cantidado],edi
    mov rdi, msgValido
    sub rsp,8
    call printf
    add rsp,8

modifico_matriz:

buscar_posicion:
    xor rax,rax
    xor rdi, rdi

    ; i-1 * lengh fila + j-1 * lengh elemento 
    mov eax, dword[auxCuidad]
    dec eax
    imul eax, dword[lengh_elemento]

    mov rdi, [int_cantidado]
    dec rdi
    imul eax, dword[lengh_fila]  ; va rax, ?

    add rax, rdi
    add dword[M+rax], 1


printear_matriz:
    jmp leer_registro

siguiente_registro:
    mov rdi, msgNoValido
    sub rsp,8
    call printf
    add rsp,8
    jmp leer_registro
    jmp leer_registro



close_file:
    mov rdi, [id]
    sub rsp,8
    call fclose
    add rsp,8

completar_vector:
    mov r9d, 10
    mov r8d, 4
buscar_menos_votado_por_cuidad:
    cmp r9d,0
    jl fin_busqueda

    buscar_por_cuidad:
        xor rax, rax
        xor rdi, rdi
        xor r10, r10

        ; i-1 * lengh fila + j-1 * lengh elemento 
        mov eax, r9d ; cuidad
        dec eax
        imul eax, dword[lengh_elemento]

        

        mov edi, r8d; candidato
        dec edi
        imul edi, dword[lengh_fila]  

        add eax, edi
        
        cmp eax, cantidad_menos_votantes
        jl  nuevo_candidato_cuidad
        jmp fin_loop

    nuevo_candidato_cuidad:
        mov r10w, word[candidatosValidos+r8d*2] 
        mov [menos_votantes], r10w

    fin_loop:
        sub r8d, 1
        cmp r8d, 0
        jg buscar_por_cuidad
        sub r9d, 1
        jmp buscar_menos_votado_por_cuidad


fin_busqueda:

print_vector:
    xor rax,rax
    lea rsi, vector_candidatos
    mov rdi, formato_vector
    sub rsp,8
    call printf
    add rsp,8

    ; print_vector_loop:
    ; mov rdi, formato_elemento
    ; mov rsi, [vector_candidatos+rax]
    ; sub rsp,8
    ; call printf
    ; add rsp,8
    ; add rax, 20 ; move to the next element
    ; cmp rax, 200
    ; jl print_vector_loop

print_matrix:
    mov rdi, formato_matrix
    sub rsp,8
    call printf
    add rsp,8

    mov rcx, 4 ; number of rows
    mov rsi, M

ret

error_open:
    mov rdi, msgError
    sub rsp,8
    call printf
    add rsp,8
    ret






