; Materia: Lenguajes de Interfaz
; Alumno: Juan Ramon Romero Adrian
; Horario: 8 a 9
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 4.1 Mayor, menor o igual con entrada del usuario
; Descripción: Captura dos números y muestra si el primero es mayor, menor o igual al segundo.

INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Ingrese el segundo numero: ", 0
    prompt2 BYTE "Ingrese el primer numero: ", 0
    msgDiferentes BYTE "Los numeros son diferentes", 0
    msgiguales BYTE "Los numeros son iguales", 0
    msgEsmayoroigual BYTE "El primer numero es mayor o igual", 0
    msgMenor BYTE "El numero es menor", 0

.code
main PROC

	; Lee y guarda el primer numero
	mov edx, OFFSET prompt2
	call WriteString 
	call ReadInt
	mov ecx, eax

	; Lee y guarda el segundo numero
	mov edx, OFFSET prompt1
	call WriteString 
	call ReadInt
	mov ebx, eax

	mov eax, ecx
	mov ebx, ebx
	
	cmp eax, ebx ; Compara los dos números leídos

	je iguales 

	mov edx, OFFSET msgDiferentes
	call WriteString

	; Decide si el primer numero es mayor o menor
	cmp eax, ebx
	jge mayor
	mov edx, OFFSET msgMenor
	call WriteString

	jmp fin
	
iguales:
	mov edx, OFFSET msgiguales
	call WriteString
    jmp fin

mayor:
	mov edx, OFFSET msgEsmayoroigual
	call WriteString

fin:
	call Crlf
	exit

main ENDP
END main
