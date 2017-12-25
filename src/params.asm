; Copy the command line arguments and print them.
;
; The command line arguments are in the Program Segment Prefix.
; The segment address of the PSP is in DS at the start of the program.
; The PSP itself occupies the memory region 00h-FFh. As COM programs
; are loaded directly after the PSP that's why we have to shift the
; labels using org 100h.
; This also means that in COM programs we can directly access the PSP
; using the right offsets (see https://en.wikipedia.org/wiki/Program_Segment_Prefix).

org 100h
use16

start:
        mov di, param           ; di = address of param
        mov si, 80h             ; Move the length of the cmd line args 
        mov cl, [si]            ;   that is at 80h in the PSP to cl.
        add si, 2               ; The cmd line args begin at 81h, but we add one more
                                ;   as at 81h the space is placed that separates the prg name
                                ;   from the arguments.
        rep movsb               ; Copy: mov es:[di], ds:[si] / inc di / inc si
        mov cl, leneol          ; Copy the line ending at the end of the already copied arguments.
        mov si, eol             
        rep movsb
        mov ax, 0900h           ; Print string.
        mov dx, param
        int 21h
        ret

; *** initialized data ***

eol     db 0ah, '$'             ; Line end for printing.
                                ; As there is always a 0dh at the end of the argument string in the
                                ; PSP we only need to add a 0ah here and of course the $ to mark the
                                ; end of the string for the 09h print function.
leneol  = $ - eol               ; Length of line end byte sequence.

; *** uninitialized data ***

param   rb 129                  ; Reserve 129 bytes for the command line arguments.
                                ; The PSP stores it on 127 bytes, but we add 0ah and $ at the end.
