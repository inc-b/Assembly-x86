[BITS 16]
[org 0x7c00]
mov bx, HELLO_MSG
call print_string
mov bx, GOODBYE_MSG
call print_string
jmp $

print_string:
	pusha
	mov ah, 0x0e

increment:
	mov al, [bx]
	add bx, 1
	int 0x10
	cmp al, 0
	jne increment
	jmp the_end

the_end:    
	popa    
	ret

HELLO_MSG :
	db 'Hello, World!', 0
	
GOODBYE_MSG :
	db 'Goodbye!', 0

times 510-($-$$) db 0
dw 0xaa55