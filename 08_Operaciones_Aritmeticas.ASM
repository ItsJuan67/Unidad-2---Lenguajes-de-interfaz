; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 8. Operaciones aritméticas
; Descripción: Prueba sumas, restas, multiplicaciones y divisiones con valores con y sin signo.

INCLUDE Irvine32.inc

.data

.code
main PROC

    ; 1. OPERACIONES: ADD Y SUB

    mov eax, 50
    mov ebx, 20

    ; EAX guarda el resultado de la suma y la resta
    add eax, ebx
    sub eax, 15
    call DumpRegs

    nop

    ; 2. CF: ACARREO EN UNA SUMA SIN SIGNO

    mov eax, 0
    mov al, 255
    ; AL vuelve a cero y CF indica el acarreo
    add al, 1

    nop

    ; 3. OF: CONDICION DE DESBORDAMIENTO

    mov eax, 0
    mov al, 127
    ; OF indica que el resultado ya no cabe como positivo en AL
    add al, 1

    nop

    ; 4. MUL: MULTIPLICACION DENTRO DE 32 BITS

    mov eax, 25
    mov ebx, 3

    mul ebx

    nop

    ; 5. MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS

    mov eax, 65537
    mov ebx, 65537

    ; El producto queda repartido entre EDX y EAX
    mul ebx

    nop

    ; 6. IMUL: MULTIPLICACION CON SIGNO

    mov eax, -5
    imul eax, eax, 3

    nop

    ; 7. DIV: DIVISION SIN SIGNO

    mov eax, 125
    mov edx, 0
    mov ebx, 12

    ; EAX guarda el cociente y EDX guarda el residuo
    div ebx

    nop

    ; 8. IDIV: DIVISION CON SIGNO

    mov eax, -125
    ; Extiende el signo de EAX a EDX antes de dividir
    cdq
    mov ebx, 12

    idiv ebx

    nop

    exit

main ENDP
END main
