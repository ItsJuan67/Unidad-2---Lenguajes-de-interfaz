; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 9. PUSH y POP
; Descripción: Guarda valores en la pila y los recupera en orden inverso con PUSH y POP.

INCLUDE Irvine32.inc

.code

main PROC

    mov eax, 30

    call DumpRegs

    ; Guarda una copia de EAX en la pila
    push eax 

    call DumpRegs
    nop

    ; BLOQUE 2 ORDEN LIFO

    ; Mete los tres valores en orden: 10, 20 y 30
    mov eax, 10
    push eax

    mov eax, 20
    push eax 

    mov eax, 30
    push eax
    call DumpRegs
    nop

    ; El ultimo guardado sale primero: EAX=30, EBX=20 y ECX=10
    pop eax
    pop ebx
    pop ecx
    call   DumpRegs
    nop
    exit 

main ENDP
END main
