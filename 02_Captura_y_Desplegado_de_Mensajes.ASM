; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 2. Captura y desplegado de mensajes
; Descripción: Lee un mensaje por teclado, lo guarda en un buffer y después lo muestra en pantalla.

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingrese un mensaje: ", 0
    buffer BYTE 50 DUP(0)

.code
main PROC
    ; Pide un mensaje por teclado
    mov edx, OFFSET prompt
    call WriteString

    ; Guarda el mensaje en el buffer
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString

    ; Muestra el mensaje capturado
    call Crlf
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP
END main
