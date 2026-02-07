org 100h 

section .data 
vga_offset dw 0xA000
display_width dw 320
display_height dw 200

section .text
start:
    ; 256-color mode
    mov ah, 0x00
    mov al, 0x13
    int 10h

    mov bx, 40
    mov ax, 40
    mov cl, 15
    call write_pixel

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

; bx: pixel_pos x
; ax: pixel_pos y
; cl: color
write_pixel:
    push es
    
    mov dx, [vga_offset]
    mov es, dx
    
    mul [display_width]
    add ax, bx
    
    mov [es:eax], cl
    
    pop es
    ret

