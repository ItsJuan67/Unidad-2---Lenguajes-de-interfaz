; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 1. Ciclos numéricos
; Descripción: Recorre los números del 1 al 10 y revisa la condición antes de imprimir cada valor.

INCLUDE Irvine32.inc 

.code 
main PROC

; Empieza el conteo en 1
mov ebx, 1

ciclo:

    ; Termina al pasar de 10
    cmp ebx, 10 
    jg fin 

    ; Muestra el valor del contador
    mov eax, ebx
    call WriteDec
    call CrLf

    inc ebx ; realiza el incremento de +1 en el registro señalado (ebx).

    jmp ciclo ; salto sin condicion para repetir el codigo mientras no se cumpla la condicion.

fin:

    exit
    
main ENDP

END main