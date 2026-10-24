; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4. Saltos
; Descripción: Usa saltos para recorrer una cadena y decidir qué parte del formato se revisa.

INCLUDE Irvine32.inc

.data
cadena BYTE "TEC-123",0

msgValido   BYTE "Formato valido",0
msgInvalido BYTE "Formato invalido",0

.code
main PROC

    ; VALIDAR LONGITUD = 7

    mov esi, 0

contar:
    ; Repite el conteo hasta encontrar el cero final
    mov al, cadena[esi]
    cmp al, 0
    je verificarLongitud

    inc esi
    jmp contar

verificarLongitud:

cmp esi, 7
    jne formatoInvalido

    ; VALIDAR LETRAS A-Z

    mov esi, 0

validarLetras:

    mov al, cadena[esi]

    cmp al, 'A'
    jb formatoInvalido

    cmp al, 'Z'
    ja formatoInvalido

    inc esi

    ; Repite hasta revisar las tres letras
    cmp esi, 3
    jl validarLetras


    ; VALIDAR GUION

    mov al, cadena[esi]

    cmp al, '-'
    jne formatoInvalido

    inc esi

    ; VALIDAR DIGITOS 0-9

validarDigitos:

    mov al, cadena[esi]

    cmp al, '0'
    jb formatoInvalido

    cmp al, '9'
    ja formatoInvalido

    inc esi

    cmp esi, 7
    jl validarDigitos

    ; FORMATO CORRECTO

    mov edx, OFFSET msgValido
    call WriteString
    call Crlf

    jmp terminar


formatoInvalido:

    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf


terminar:

    exit

main ENDP
END main