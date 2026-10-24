; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 5.1 Repetir hasta que el usuario ingrese cero
; Descripción: Pide un número en cada vuelta y termina cuando se ingresa cero.

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingrese un numero (0 para salir): ", 0

.code
main PROC
ciclo:
    ; Pide un numero en cada vuelta
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    call Crlf

	cmp eax, 0 ; Compara EAX con 0
	jne ciclo ; Si no es cero, repite

	; Termina cuando el numero es cero
	exit

main ENDP
END main
