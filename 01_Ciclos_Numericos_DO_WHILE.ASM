; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 1. Ciclos numéricos
; Descripción: Muestra los números del 1 al 100 y revisa al final si el ciclo debe repetirse.

INCLUDE Irvine32.inc

.code
main PROC

    ; Empieza el conteo en 1
    mov ebx, 1

ciclo:
    ; Muestra el numero actual
    mov eax, ebx
    call WriteDec
    call CrLf

    ; Aumenta el contador y repite hasta 100
    inc ebx

    cmp ebx, 100
    jle ciclo

    exit

main ENDP
END main