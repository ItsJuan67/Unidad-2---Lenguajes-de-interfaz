; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 10. Cadena con decimal
; Descripción: Calcula el avance de una descarga y convierte los resultados a cadenas decimales.

INCLUDE Irvine32.inc

.data
    tamArchivo DWORD 100000
    bloques DWORD 125
    tamBloque DWORD 512

    descargados DWORD ?
    pendientes DWORD ?
    porcentaje DWORD ?
    grupos DWORD ?
    residuo DWORD ?

    msg1 BYTE "Bytes descargados: ",0
    msg2 BYTE "Bytes pendientes: ",0
    msg3 BYTE "Porcentaje de avance: ",0
    msg4 BYTE "Grupos completos de 1024: ",0
    msg5 BYTE "Residuo del agrupamiento: ",0
    salto BYTE 13,10,0

    buffer BYTE 11 DUP(0)

.code

convertirDecimal PROC
    ; Guarda los registros que va a usar la conversion
    push eax
    push ebx
    push ecx
    push edx
    push edi

    ; Empieza al final del buffer y deja el cero que cierra la cadena
    mov edi, esi
    add edi, 10
    mov BYTE PTR [edi], 00h

    mov ebx, 10

    cmp eax, 0
    jne convertir

    ; El cero tambien necesita su caracter en la cadena
    dec edi
    mov BYTE PTR [edi], '0'
    jmp terminado

convertir:
    ; Divide entre diez para sacar el ultimo digito en EDX
    xor edx, edx
    div ebx

    ; Pasa el digito a ASCII y lo guarda de derecha a izquierda
    add dl, '0'
    dec edi
    mov [edi], dl

    cmp eax, 0
    jne convertir

terminado:
    ; Mover los digitos al inicio del buffer
    mov esi, edi
    mov ecx, 0

contar:
    cmp BYTE PTR [esi+ecx], 0
    je copiarInicio
    inc ecx
    jmp contar

copiarInicio:
    mov edi, OFFSET buffer
    ; Cuenta tambien el cero final y copia hacia adelante
    inc ecx
    cld
    rep movsb

    ; Recupera los registros en el orden contrario
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
convertirDecimal ENDP

main PROC

    ; 1. Bytes descargados
    mov eax, bloques
    mul tamBloque
    mov descargados, eax

    ; 2. Bytes pendientes
    mov eax, tamArchivo
    sub eax, descargados
    mov pendientes, eax

    ; 3. Porcentaje entero
    mov eax, descargados
    mov ebx, 100
    mul ebx
    mov ebx, tamArchivo
    div ebx
    mov porcentaje, eax

    ; 4. Grupos de 1024 y residuo
    mov eax, descargados
    xor edx, edx
    mov ebx, 1024
    div ebx
    mov grupos, eax
    mov residuo, edx

    ; Mostrar bytes descargados
    mov edx, OFFSET msg1
    call WriteString
    mov eax, descargados
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; Mostrar bytes pendientes
    mov edx, OFFSET msg2
    call WriteString
    mov eax, pendientes
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; Mostrar porcentaje
    mov edx, OFFSET msg3
    call WriteString
    mov eax, porcentaje
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    mov edx, OFFSET salto
    call WriteString

    ; Mostrar grupos completos
    mov edx, OFFSET msg4
    call WriteString
    mov eax, grupos
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; Mostrar residuo
    mov edx, OFFSET msg5
    call WriteString
    mov eax, residuo
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit

main ENDP
END main
