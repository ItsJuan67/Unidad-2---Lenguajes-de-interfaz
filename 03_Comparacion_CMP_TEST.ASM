; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 3. Comparación y prueba
; Descripción: Compara valores con CMP y TEST para observar los cambios en las banderas.

INCLUDE Irvine32.inc 

.code
main PROC

; CONDICION 1: ZERO FLAG

    ;mov EBX, 1
    ;cmp EBX, 1
    ;call dumpRegs

    ; Compara dos valores iguales
    mov EBX, 1
    mov EAX, 01h 
    cmp EAX, EBX
    call dumpRegs

    mov cl, 11111111b 
    cmp cl, cl 
    call dumpRegs

; CONDICION 2: SING FLAG

    MOV EAX, 0
    MOV EBX, 0

    MOV al, -5
    mov bl, 1
    cmp al, bl
    call dumpRegs

; CONDICION 3 CARRY FLAG 

    mov EAX, 0
    mov EBX, 0 

    ; Suma uno para generar acarreo
    mov al, 255 
    add al, 1
    call dumpRegs

; CONDII=CION 4 OVERFLOW FLAG

    mov EAX, 0 
    mov EBX, 0 

    mov al, -128
    mov bl, 1
    cmp al, bl 
    call dumpRegs

; CONDICION 5 TEST

    ; Revisa el bit bajo sin cambiar EAX
    mov EAX, 0 
    mov EBX, 5 ; 00000101b
    TEST EAX, 1

    ;00000000B
    ;00000001B
    ;==========
    ;00000000B

    ; Prueba el bit de signo
    mov EAX, 0 
    mov al, 10000000b 
    TEST al, al

    call dumpRegs

    exit

main ENDP

END main


