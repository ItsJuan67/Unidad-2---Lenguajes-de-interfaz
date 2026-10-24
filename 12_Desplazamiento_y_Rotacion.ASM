; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 12. Desplazamiento y rotación
; Descripción: Desplaza y rota bits, incluyendo las rotaciones que utilizan el acarreo.

INCLUDE Irvine32.inc

.code 

main PROC

    mov eax, 0
    mov ebx, 0
    mov ecx, 0 
    mov edx, 0 

    ; 1 - SHL - Desplazar una posicion a la izquierda.

    mov al, 00000001b
    shl al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 2 - SHR - Desplazar una posicion a la derecha.

    mov al, 00001101b
    shr al, 1

    call DumpRegs
    call WriteBin
    call Crlf


    ; 3 - SAR - Conservar el signo.

    mov al, -8
    sar al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 4 - SAR - Con operaciones no exactas.

    mov al, -9
    sar al, 1 

    call DumpRegs
    call WriteBin
    call Crlf

    ; 5 - CONTEO - Desplazar 2 posiciones hacia la izquierda.

    mov al, 00001111b 
    shl al, 2

    call DumpRegs
    call WriteBin
    call Crlf

    ; 6 - CONTEO - Desplazar 2 posiciones hacia la derecha.

    mov al, 00001111b 
    mov cl, 2
    shr al, cl

    call DumpRegs
    call WriteBin
    call Crlf

    ; 7 - ROR - Rotar una posicion a la derecha.

    mov al, 00001101b
    ror al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 8 - ROL - Rotar una posicion a la izquierda.

    mov al, 10000000b
    rol al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 9 - RCL - Rotar a la izquierda incluyendo el acarreo.

    mov al, 10000000b
    clc
    rcl al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    ; 10 - RCR - Rotar a la derecha incluyendo el acarreo.

    mov al, 00000001b
    clc
    rcr al, 1

    call DumpRegs
    call WriteBin
    call Crlf

    exit

main ENDP

END main
