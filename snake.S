org 100h 

section .data 
vga_offset dd 0xA0000
display_width dw 320
display_height dw 200

section .text
start:
    ; 256-color mode
    mov ah, 0x00
    mov al, 0x13
    int 10h

    ; Write Pixel
    mov ah, 0x0C
    mov al, 15
    mov cx, 50
    mov dx, 50
    int 10h

    mov ah, 40
    mov al, 40
    mov bl, 15
    call write_pixel

    ;mov eax, [vga_offset]
    ;add eax, 5500
    ;mov [eax], 15

    ; Key Wait
    mov ah, 00h
    int 16h

    ; Text Mode
    mov ah, 0x00 
    mov al, 0x03 
    int 10h


    ; Exit
    mov ax, 4C00h
    int 21h

; ah: pixel_pos x
; al: pixel_pos y
; bl: color
write_pixel:
    mov bh, [display_width]
    mul bh
    add al, ah
    mov ecx, [vga_offset]
    add cl, al
    mov [ecx], bl
    ret
