#include "cola_asm.h"

.global cola_crear
.global cola_destruir
.global cola_encolar
.global cola_desencolar
.global cola_esta_vacia
.global cola_ver_primero
.global nodo_crear

nodo_crear:
	pushq %rbx
	movq %rdi, %rbx
	movl $1, %edi
	movl $SIZEOF_NODO, %esi
	call calloc
	cmpq $0, %rax
	je .L11
	movq %rbx, OFFSET_DATA(%rax)
	movq $0, OFFSET_NEXT(%rax)
.L11:
	pop %rbx
	ret

cola_crear:                /* Se recomienda usar calloc() */
	movl $1, %edi
	movl $SIZEOF_COLA, %esi
	call calloc	
	ret

cola_esta_vacia:           /* Se debe usar un conditional move (cmovXX/setXX) */
	cmpq $0, OFFSET_HEAD(%rdi)
	sete %al
	ret

cola_ver_primero:          /* Se debe usar un salto condicional */
	pushq %rbx
	movq %rdi, %rbx
	call cola_esta_vacia
	cmpb $0, %al
	jne .L1
	movq OFFSET_HEAD(%rbx), %rax
	movq OFFSET_DATA(%rax), %rax
	jmp .L2
.L1:
	movl $0, %eax
.L2:
	popq %rbx
	ret

cola_encolar:              /* Se debe usar un conditional move */
	pushq %rbp
	pushq %rbx
	movq %rdi, %rbx # rbx = cola
	movq %rsi, %rdi # rdi = valor
	call nodo_crear
	cmpq $0, %rax # rax = new node
	je .L8
	movq %rbx, %rdi # rdi = cola
	movq %rax, %rbp # rbp = new node
	call cola_esta_vacia
	cmpb $1, %al
	je .L9
	movq OFFSET_TAIL(%rbx), %rdi # rdi = tail
	movq %rbp, OFFSET_NEXT(%rdi) # refresh new node
.L10:
	movq %rbp, OFFSET_TAIL(%rbx)
	movl $1, %eax
	jmp .L8
.L9:
	movq %rbp, OFFSET_HEAD(%rbx) # head = new node
	jmp .L10
.L8:
	pop %rbx
	pop %rbp
	ret

cola_desencolar:           /* Se recomienda usar dos saltos condicionales + un cmov */
	pushq %rbp
	pushq %rbx
	movq %rdi, %rbx # rbx = cola
	call cola_esta_vacia
	cmpb $0, %al
	jne .L5
	movq %rbx, %rdi # rdi = cola
	call cola_ver_primero
	movq %rax, %rbp # rbp = data
	movq OFFSET_HEAD(%rbx), %rdi # rdi = old head
	movq OFFSET_NEXT(%rdi), %rax # rax = new head
	movq %rax, (%rbx) # cola head changed
	cmpq $0, %rax
	jne .L6
	movq $0, OFFSET_TAIL(%rbx)
.L6:
	call free # remember, rdi = old head; rax = new head, we need rax = data
	movq %rbp, %rax
	jmp .L7
.L5:
	movl $0, %eax
.L7:
	popq %rbx
	popq %rbp
	ret

cola_destruir:             /* Sin restricciones */
	pushq %rbx
	movq %rdi, %rbx
.L3:
	movq %rbx, %rdi
	call cola_esta_vacia
	cmpb $0, %al
	jne .L4
	movq %rbx, %rdi
	call cola_desencolar
	jmp .L3
.L4:
	movq %rbx, %rdi
	call free
	popq %rbx
	ret