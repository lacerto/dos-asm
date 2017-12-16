; Write a string with white foreground color to the screen at position 0,0.

org 100h
use16

start:
        mov ah, 13h             ; BIOS write string
        mov al, 01h             ; chars only, attribute in bl, cursor will be moved
        xor bh, bh              ; video page 0
        mov bl, 0000_1111b      ; attribute: background black, foreground white
        mov cx, strlen          ; string length
        mov dh, 00h             ; row coordinate
        mov dl, 00h             ; column coordinate
        push ds
        pop es
        mov bp, text            ; es:bp points to the text
        int 10h
        ret

; *** initialized data ***

text    db 'Hello world!', 0ah, 0dh        
strlen  = $-text ; = permits a forward reference, using equ would result in an error