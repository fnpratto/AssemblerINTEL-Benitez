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


section .data
    filename db 'teams.dat', 0
    formatTeam db "Team: %s", 10, 0
    formatWins db "Wins: %d", 10, 0
    formatLosses db "Losses: %d", 10, 0
    formatDifferential db "Point Differential: %d", 10, 0
    buffer db 20, 0  ; Buffer for team names
    maxWins dd 0
    maxDifferential dd 0

section .bss
    nombreDelEquipo resb 20
    resultados resw 1
    tantosFavor resw 1
    tantosEnContra resw 1
    partidosGanados resd 1
    partidosPerdidos resd 1
    diferencia resd 1
    campeon resb 20

section .text
extern fopen, fread, fclose, printf
global main

%macro mPrintf 1
    sub rsp, 8
    mov rdi, %1
    mov rax, 0
    call printf
    add rsp, 8
%endmacro

main:
    ; Open file
    lea rdi, [filename]
    mov rsi, 0  ; "r" for reading
    call fopen
    test rax, rax
    jz end  ; If fopen failed, exit
    mov rbx, rax  ; Save file pointer

read_loop:
    ; Read team name
    lea rdi, [tempName]
    mov rsi, 1
    mov rdx, 20
    call fread
    test rax, rax
    jz close_file  ; If fread failed or EOF, exit loop

    ; Read results
    lea rdi, [results]
    mov rsi, 1
    mov rdx, 2
    call fread
    test rax, rax
    jz close_file  ; If fread failed or EOF, exit loop

    ; Read points for
    lea rdi, [pointsFor]
    mov rsi, 1
    mov rdx, 2
    call fread
    test rax, rax
    jz close_file  ; If fread failed or EOF, exit loop

    ; Read points against
    lea rdi, [pointsAgainst]
    mov rsi, 1
    mov rdx, 2
    call fread
    test rax, rax
    jz close_file  ; If fread failed or EOF, exit loop

    ; Calculate wins and losses
    movzx eax, word [results]
    xor ecx, ecx
    xor edx, edx

    ; Count wins and losses
    mov ebx, 16
calc_wins_losses:
    shr ax, 1
    jc win
    inc edx  ; Increment losses
    jmp check_loop
win:
    inc ecx  ; Increment wins
check_loop:
    dec ebx
    jnz calc_wins_losses

    ; Store wins and losses
    mov [wins], ecx
    mov [losses], edx

    ; Calculate point differential
    movzx eax, word [pointsFor]
    movzx ebx, word [pointsAgainst]
    sub eax, ebx
    mov [differential], eax

    ; Check if this team has the most wins or best differential in case of a tie
    mov eax, [wins]
    mov ebx, [maxWins]
    cmp eax, ebx
    jg update_champion
    je check_differential
    jmp read_loop

update_champion:
    ; Update the champion data
    mov [maxWins], eax
    lea rsi, [tempName]
    lea rdi, [champion]
    mov rcx, 20
    rep movsb
    mov eax, [differential]
    mov [maxDifferential], eax
    jmp read_loop

check_differential:
    mov eax, [differential]
    mov ebx, [maxDifferential]
    cmp eax, ebx
    jg update_champion
    jmp read_loop

close_file:
    ; Close the file
    mov rdi, rbx
    call fclose

    ; Print the champion's name
    lea rdi, [formatTeam]
    lea rsi, [champion]
    mPrintf rdi

    ; Print the number of wins
    lea rdi, [formatWins]
    mov esi, [maxWins]
    mPrintf rdi

    ; Print the number of losses
    lea rdi, [formatLosses]
    mov esi, 16  ; Total games
    sub esi, [maxWins]
    mPrintf rdi

    ; Print the point differential
    lea rdi, [formatDifferential]
    mov esi, [maxDifferential]
    mPrintf rdi

end:
    ; Exit program
    mov eax, 0
    ret
