;17.	La liga de basquetball de Villa Tachito desea tener un programa para determinar quién fue el 
;ganador del torneo anual de clubes.  Para ello cuenta con un archivo que contiene:
;•	Nombre del equipo: 20 caracteres alfanuméricos
;•	Resultados: BPF S/S de 16 bits
;•	Tantos a favor: Empaquetado de 2 bytes
;•	Tantos en contra: Empaquetado de 2 bytes
;El programa deberá imprimir por pantalla el nombre del campeón del torneo 
;junto con la cantidad de partidos ganados y perdidos y su diferencia de tantos. 
; Para determinar la cantidad de partidos ganados se procesa el campo Resultados 
;que indica por cada bit el resultado de un partido del torneo. 
;(En total cada equipo jugó 16 partidos) 
;Si el bit está en 1 significa que el equipo ganó ese partido, 
;si está en 0 significa que lo perdió.

define CANTPARTIDOS 2


section .data
    filename db 'team.dat', 0
    formatTeam db "Team: %s", 10, 0
    formatWins db "Wins: %s", 10, 0
    formatWinConvert db "Wins: %d%d", 10, 0
    formatTantos db "Tantos: %hi", 10, 0
    formatLosses db "Losses: %hi", 10, 0
    formatDifferential db "Point Differential: %hi", 10, 0
    formatNumber db "%hi", 10, 0 
    formatNumberLong db "%li%", 10, 0
    modo db "r", 0 
    maxWins dd 0
    maxDifferential dd 0
    errorOpenMsg db "Error opening file", 0
    nombreEquipoAux         db  "********************",0
    resultadosAux           db  "****************",0
    registerFile:
      nombreDelEquipo  times   20                    db ' '
      resultados       times   CANTPARTIDOS                   db ' '
      tantosFavor       times 2                      db ' '
      tantosEnContra    times 2                      db ' '    ;Como es un BPF s/signo no haces falta que lo valide. Siempre sera Positivo ó 0 (Cero)
      barraN                                         db ' '

section .bss
    partidosGanados resd 1
    partidosPerdidos resd 1
    diferencia resd 1
    campeon resb 20
    idArchivo resq 1

section .text
extern fopen, fread, fclose, printf ,fgets, gets , atoi, strtoll, puts
global main

%macro mFread 0
    sub rsp, 8
    call fread
    add rsp, 8
%endmacro

%macro mPrintf 0
    sub rsp, 8
    call printf
    add rsp, 8
%endmacro

%macro mFopen 0
    sub rsp, 8
    call fopen
    add rsp, 8 
%endmacro

%macro mgets 0
    sub rsp, 8
    call fgets
    add rsp, 8
%endmacro

%macro mFclose 0
    sub rsp, 8
    call fclose
    add rsp, 8
%endmacro

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, modo  ; "r" for reading
    mFopen   
    cmp rax,0
    jle errorOpen  ; If fopen failed, exit
    mov qword[idArchivo], rax  ; Save file pointer

read_loop:
readRegister:
    mov     rdi, registerFile   ;Param 1: direccion de area de memoria donde se copiaran los datos
    mov     rsi, 41             ;Param 2: longitud del registro completo
    mov     rdx, 1              ;Param 3: cant de registros
    mov     rcx, [idArchivo]    ;Param 4: el handle del archivo a leer para completar el registro
    sub     rsp, 8
    call    fread
    add     rsp, 8

    cmp     rax, 0
    jle     close_file


    ; Add a null terminator to the team name string

validar_campos:
    mov     rcx, 20
    mov     rsi, nombreDelEquipo
    mov     rdi, nombreEquipoAux
    rep movsb
    
    mov rdi, formatTeam
    mov rsi, nombreEquipoAux
    mPrintf 

    mov     rcx, 16
    mov     rsi, resultados
    mov     rdi, resultadosAux
    rep movsb

    ; Print the number of wins
    mov rdi, formatWins
    mov rsi, resultados
    mPrintf 

    ; Print the number of losses
    mov rdi, formatTantos; Total games
    mov rsi, [tantosFavor]
    mPrintf 

    ; Print the point differential
    mov rdi, formatTantos
    mov rsi, [tantosEnContra]
    mPrintf 


    mov rax, [resultados]
    sub rsp,8
    call strtoll
    add rsp,8













    ; Count wins and losses
    mov rbx, 16 ; contador
    mov rdi, 0
    mov r9,0


calc_wins_losses:
    mov rax,[resultados+rdi]
    cmp rax, 1
    je win
    jne loss
    inc rdi  ; Increment losses
    jmp check_loop
win:
    mov r9, [partidosGanados]
    inc r9
    mov [partidosGanados],r9  ; Increment wins
    jmp check_loop

loss:
    mov r9, [partidosPerdidos]
    inc r9
    mov [partidosPerdidos],r9  ; Increment wins
check_loop:
    dec rbx
    cmp rbx, 0
    jne calc_wins_losses


    ; Calculate point differential
    movzx rax, word [tantosFavor]
    movzx rbx, word [tantosEnContra]
    sub rax, rbx
    mov [diferencia], rax

    ; Check if this team has the most wins or best differential in case of a tie
    mov eax, [partidosGanados]
    mov ebx, [maxWins]
    cmp eax, ebx
    jg update_champion
    je check_differential
    jmp read_loop

update_champion:
    ; Update the champion data
    mov [maxWins], eax
    mov rsi, [nombreDelEquipo]
    mov [campeon], rsi
    mov eax, [diferencia]
    mov [maxDifferential], eax
    jmp read_loop

check_differential:
    mov eax, [diferencia]
    mov ebx, [maxDifferential]
    cmp eax, ebx
    jg update_champion
    jmp read_loop

close_file:
    ; Close the file
    mov rdi, [idArchivo]
    mFclose

    ; Print the champion's name
    mov rdi, formatTeam
    mov rsi, campeon
    mPrintf 

    ; Print the number of wins
    mov rdi, formatWins
    mov esi, [maxWins]
    mPrintf 

    ; Print the number of losses
    mov rdi, formatLosses
    mov esi, 16  ; Total games
    sub esi, [maxWins]
    mPrintf 

    ; Print the point differential
    mov rdi, formatDifferential
    mov esi, [maxDifferential]
    mPrintf 

end:
    ; Exit program
    mov eax, 0
    ret

errorOpen:
    lea rdi, [errorOpenMsg]
    mPrintf
    ret