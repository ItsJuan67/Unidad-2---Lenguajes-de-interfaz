; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 6. Decremento e incremento
; Descripción: Resta un intento por cada PIN incorrecto y muestra cuántos intentos quedan.

INCLUDE Irvine32.inc

.data
PINcorrecto = 1234

msgpin BYTE "Ingresa el PIN: ",0
msgerror BYTE "PIN incorrecto",0
msgintentos BYTE "Intentos restantes: ",0
msgacceso BYTE "Acceso permitido",0
msgbloqueado BYTE "intentos excedidos, borrando datos del dispositivo...",0

.code

main PROC

    ; Empieza con tres intentos
    mov ebx, 3

intentar:

    mov edx, OFFSET msgpin
    call WriteString
    call ReadInt

    ; Da acceso si el PIN coincide
    cmp eax, PINcorrecto
    je acceso

    mov edx, OFFSET msgerror
    call WriteString
    call Crlf

    ; Resta un intento al fallar
    dec ebx

    jz bloqueado

    ; Muestra los intentos que quedan
    mov edx, OFFSET msgintentos
    call WriteString

    mov eax, ebx
    call WriteDec
    call Crlf

    jmp intentar

acceso:

    mov edx, OFFSET msgacceso
    call WriteString
    call Crlf
    jmp fin

bloqueado:

    ; Avisa cuando se agotan los intentos
    mov edx, OFFSET msgbloqueado
    call WriteString
    call Crlf

fin:

    exit

main ENDP

END main