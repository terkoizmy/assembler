section .data
    num db 12                         ; Angka yang akan diperiksa
    even_msg db "Angka genap", 10, 0  ; Pesan jika angka genap
    odd_msg db "Angka ganjil", 10, 0  ; Pesan jika angka ganjil

section .text
    global main
    extern printf

main:
    push rbp                          ; Menyimpan base pointer
    mov rbp, rsp                      ; Set up new stack frame

    movzx eax, byte [num]             ; Memuat nilai num ke eax
    and eax, 1                        ; Bitwise AND dengan 1 (cek bit terakhir)
    jz even                           ; Jika hasil 0 (genap), lompat ke label 'even'

    ; Jika ganjil
    mov rdi, odd_msg                  ; Set argumen pertama printf ke odd_msg
    jmp print                         ; Lompat ke bagian print

even:
    mov rdi, even_msg                 ; Set argumen pertama printf ke even_msg

print:
    xor eax, eax                      ; bersihkan eax
    call printf                       ; Panggil printf

    mov rsp, rbp                      ; Restore stack pointer
    pop rbp                           ; Restore base pointer

    xor eax, eax                      ; Return 0
    ret                               ; Return dari main