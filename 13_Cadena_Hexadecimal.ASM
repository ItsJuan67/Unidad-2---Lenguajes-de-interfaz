; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 13. String hexadecimal
; Descripción: Convierte un número a una cadena de ocho dígitos hexadecimales y la muestra en pantalla.

INCLUDE Irvine32.inc

.data

    numero DWORD 0DC43BA21h

    bufferHex BYTE 9 DUP(0)

    mensaje BYTE "Numero hexadecimal: ", 0

.code

main PROC

    mov eax, numero

    ; Llena el buffer desde la ultima posicion hacia la primera
    mov esi, 7

    ; Un DWORD se representa con ocho digitos hexadecimales
    mov ecx, 8

convertir:

    ; Guardar temporalmente el numero
    mov ebx, eax

    ; Extraer los ultimos 4 bits
    and ebx, 0000000Fh

    ; Convertir a caracter ASCII
    cmp bl, 9
    jbe esNumero

    ; Si es de A hasta F
    ; El ajuste de siete permite pasar de 10-15 a las letras A-F
    add bl, 7

esNumero:

    add bl, '0'

    ; Guardar en el buffer
    mov bufferHex[esi], bl

    ; Desplazar 4 bits a la derecha
    shr eax, 4

    ; Retroceder una posicion
    dec esi

    ; Repite una vez por cada digito hexadecimal
    loop convertir

    ; Agregar terminador nulo
    mov bufferHex[8], 0

    ; Mostrar resultado
    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET bufferHex
    call WriteString

    call Crlf

    exit

main ENDP

END main
