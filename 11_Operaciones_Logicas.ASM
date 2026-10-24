; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 11. Operaciones lógicas
; Descripción: Modifica bits con AND, OR, XOR y NOT, y revisa su estado con TEST.

INCLUDE Irvine32.inc

.code

main PROC

    ; 0 - Encendido
    ; 1 - Alarma
    ; 2 - Conectada
    ; Estado inicial 00000101

    ; 1 - AND - Extraer el estado de encendido

    mov eax, 0
    mov ebx, 0
    mov al, 00000101b
    mov bl, al
    ; La mascara deja en BL solamente el bit de encendido
    and bl, 00000001b
    call DumpRegs
    nop

    ; 2 - OR - Encender alarma

    mov eax, 0
    mov al, 00000101b
    ; Activa el bit de alarma sin cambiar los otros
    or al, 00000010b
    call DumpRegs
    nop

    ; 3 - XOR - Desconectar y conectar

    mov eax, 0
    mov al, 00000101b
    ; Cambia solo el bit de conexion; repetir XOR lo deja como antes
    xor al, 00000100b
    call DumpRegs
    nop

    ; Volver a conectar

    xor al, 00000100b
    call DumpRegs
    nop

    ; 4 - NOT - Devolver estados

    mov eax, 0
    mov al, 00000101b
    not al
    call DumpRegs
    nop

    ; 5 - TEST - Evaluar alarma y realizar salto

    mov eax, 0
    mov al, 00000111b
    ; TEST revisa el bit sin cambiar AL; JNZ salta cuando esta encendido
    test al, 00000010b
    jnz alarma_encendida

    ; Alarma apagada

    mov ebx, 0
    jmp fin

alarma_encendida:

    ; Alarma encendida

    mov ebx, 1
    call DumpRegs
    nop

fin:

    exit

main ENDP
END main
