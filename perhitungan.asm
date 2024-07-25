section .data
    add_msg db "Hasil penjumlahan (10 + 5): %ld", 10, 0
    sub_msg db "Hasil pengurangan (10 - 5): %ld", 10, 0
    mul_msg db "Hasil perkalian (10 * 5): %ld", 10, 0
    div_msg db "Hasil pembagian (10 / 5): %ld", 10, 0

section .text
    global main
    extern printf

main:
    ; Prologue
    push rbp
    mov rbp, rsp

    ; Penjumlahan
    mov rdi, add_msg
    mov rsi, 10    ; 10 + 5
    add rsi, 5
    call printf

    ; Pengurangan
    mov rdi, sub_msg
    mov rsi, 10    ; 10 - 5
    sub rsi, 5
    call printf

    ; Perkalian
    mov rax, 10         ; Dividend
    mov rdi, 5          ; Divisor
    mul rdi
    mov rsi, rax        ; Move quotient to RSI for printf
    mov rdi, mul_msg    ; Format string
    call printf         ; Call printf

    ; Pembagian
    mov rax, 10         ; Dividend
    mov rdi, 5          ; Divisor
    div rdi
    mov rsi, rax        ; Move quotient to RSI for printf
    mov rdi, div_msg    ; Format string
    call printf         ; Call printf

    ; Epilogue
    mov rsp, rbp
    pop rbp

    ; Exit program
    mov rax, 60   ; system call number (sys_exit)
    xor rdi, rdi  ; exit code 0
    syscall