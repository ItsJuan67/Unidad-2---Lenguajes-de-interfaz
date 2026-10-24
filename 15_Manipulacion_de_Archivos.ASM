; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 15. Manipulación de archivo
; Descripción: Crea Inventario.txt, escribe el texto 125 y cierra el archivo con un aviso de éxito o error.

INCLUDE Irvine32.inc

.data

    nombreArchivo BYTE "Inventario.txt", 0 
    texto BYTE "125", 0 
    archivoHandle DWORD ?

    mensajeExito BYTE "Archivo guardado correctamente. ", 0 
    mensajeError BYTE "Ocurrio un error, el archivo no se a guardado correctamente! ", 0 

.code

main PROC

    ; 1 - Crear el archivo.
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile

    ; Si no pudo crearlo, pasa al mensaje de error
    cmp eax, INVALID_HANDLE_VALUE
    je error

    ; Guarda el identificador para escribir y cerrar el mismo archivo
    mov archivoHandle , eax 

    mov eax, archivoHandle
    mov edx, OFFSET texto
    ; Escribe el texto sin incluir el cero final de la cadena
    mov ecx, SIZEOF texto - 1
    call WriteToFile

    jc errorEscritura

    cmp eax, SIZEOF texto - 1
    jne errorEscritura 

    ; 3 - Cerrar archivo.txt.
    mov eax, archivoHandle 
    call CloseFile

    test eax, eax
    jz error

    mov edx, OFFSET mensajeExito
    call WriteString
    jmp fin

errorEscritura:

    ; Cierra el archivo antes de mostrar el error de escritura
    mov eax, archivoHandle
    call CloseFile
    
error:

    mov edx, OFFSET mensajeError
    call WriteString

fin:

    exit

main ENDP

END main
