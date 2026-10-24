; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6.1 Control de ocupación de un estacionamiento
; Descripción: Cuenta la ocupación de forma automática hasta 20 y avisa cuando el estacionamiento está lleno.

INCLUDE Irvine32.inc

.data
	msgMax BYTE "Estacionamiento lleno", 0
    msgIngreso BYTE "Vehiculo ingresado. Espacios ocupados: ", 0
    limite EQU 20

.code
main PROC
	; Inicia sin espacios ocupados
	mov ebx, limite 
	mov ecx, 0 

cicloEstacionamiento:
    ; Revisa si ya se alcanzo el limite
    cmp ecx, ebx
    jge bloqueado

    ; Registra un ingreso y muestra la ocupacion
    inc ecx
    mov edx, OFFSET msgIngreso
    call WriteString
    mov eax, ecx
    call WriteDec
    call Crlf
    jmp cicloEstacionamiento

bloqueado:
	; Avisa que ya no hay espacio
	mov edx, OFFSET msgMax
    call WriteString
    call Crlf

fin:
	exit
	
main ENDP
END main
