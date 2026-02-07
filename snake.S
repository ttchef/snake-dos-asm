org 100h

section .text
start:
    mov ah, 09h         ; DOS print string
    mov dx, msg
    int 21h
    
    mov ah, 00h         ; Wait for key
    int 16h
    
    mov ax, 4C00h       ; Exit to DOS
    int 21h

msg: db "Snake game coming soon!", 13, 10, '$'

