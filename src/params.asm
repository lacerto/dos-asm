org 100h
use16

start:
        push ds
        pop es
        mov di, param
        mov si, 80h
        mov cl, [si]
        inc si
        inc si
        rep movsb
        mov cl, leneol
        mov si, eol
        rep movsb
        mov ax, 0900h
        mov dx, param
        int 21h
        ret

eol     db 0ah, '$'
leneol  = $ - eol
param   rb 130
