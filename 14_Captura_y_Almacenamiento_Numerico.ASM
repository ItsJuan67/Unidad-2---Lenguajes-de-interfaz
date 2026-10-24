; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 14. Captura y almacenamiento de dato numérico
; Descripción: Valida la cantidad recibida, la suma a las 25 unidades iniciales y muestra la existencia actual.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Cantidad de tarjetas recibidas (1-99): ",0
errorMsg BYTE "Error: ingrese un numero entre 1 y 99.",0
resultado BYTE "Existencia actual: ",0
unidades BYTE " unidades",0

buffer BYTE 10 DUP(0)
bufferNumero BYTE 12 DUP(0)

cantidadRecibida DWORD 0
existenciaActual DWORD 25

.code
main PROC

pedirCantidad:

    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET buffer

    mov ecx, SIZEOF buffer
    call ReadString

    ; Validar longitud: 1 o 2 digitos
    cmp eax, 1
    jb entradaInvalida

    cmp eax, 2
    ja entradaInvalida

    ; Guardar longitud
    mov ecx, eax
    mov esi, OFFSET buffer
    mov ebx, 0

validarDigitos:

    movzx eax, BYTE PTR [esi]

    cmp al, '0'
    jb entradaInvalida

    cmp al, '9'
    ja entradaInvalida

    sub eax, '0'

    imul ebx, 10
    add ebx, eax

    inc esi
    loop validarDigitos

    cmp ebx, 1
    jb entradaInvalida

    cmp ebx, 99
    ja entradaInvalida

    mov cantidadRecibida, ebx

    mov eax, 25
    add eax, cantidadRecibida
    mov existenciaActual, eax

    mov edx, OFFSET resultado
    call WriteString

    mov eax, existenciaActual
    call convertirDecimal

    mov edx, OFFSET bufferNumero
    call WriteString

    mov edx, OFFSET unidades
    call WriteString
    call Crlf

    jmp terminar

entradaInvalida:

    ; Muestra el error y vuelve a pedir la cantidad
    mov edx, OFFSET errorMsg
    call WriteString
    call Crlf
    jmp pedirCantidad

terminar:
    exit

main ENDP

; CONVERSION DE NUMERO A CADENA DECIMAL

convertirDecimal PROC
    ; Guarda los registros mientras arma el texto
    pushad

    ; Reserva el final del buffer para el cero que cierra la cadena
    mov edi, OFFSET bufferNumero
    add edi, SIZEOF bufferNumero - 1
    mov BYTE PTR [edi], 0

    mov ebx, 10

convertir:
    ; Saca el ultimo digito como residuo y lo guarda de derecha a izquierda
    mov edx, 0
    div ebx

    add dl, '0'
    dec edi
    mov [edi], dl

    cmp eax, 0
    jne convertir

    ; Mover la cadena al inicio del buffer
    mov esi, edi
    mov edi, OFFSET bufferNumero

copiar:
    ; Copia tambien el cero final para que WriteString sepa donde parar
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi

    cmp al, 0
    jne copiar

    popad
    ret
convertirDecimal ENDP

END main
