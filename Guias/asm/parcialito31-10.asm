
name 'parcialito 31/10'
;En las direcciones 200 y 201 hay datos, 
;poner en la direccion 202 el menor y en 203 el mayor.


org 100h  

MOV CL,10110111b
MOV [200], CL 

MOV DL,10100000b
MOV [201], DL


MOV AL, [200]
MOV BL, [201]

CMP AL, BL 
JAE al_mayor; si el carry=0 salta pq AL esMAYOR  
JMP bl_mayor ;  
 

al_mayor:
    MOV [202],BL  ;almaceno el menor
    MOV [203],AL  ;almaceno el mayor
    JMP fin


bl_mayor:
    MOV [202],AL  ;almaceno el menor
    MOV [203],BL  ;almaceno el mayor
    JMP fin



 

fin:
    INT 21h

ret




