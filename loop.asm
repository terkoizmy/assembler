section .data
    counter dd 10
    msg db "Looping iterasi: %d", 10, 0

section .text
    global main
    extern printf

main:
    ; Prologue
    push rbp
    mov rbp, rsp
    ; Menyimpan register yang akan digunakan
    push rbx

    ; Inisialisasi counter
    mov ebx, [counter]

loop_start:
    ; Persiapkan argumen untuk printf
    mov rdi, msg
    mov esi, ebx  ; Nilai counter sebagai argumen kedua
    xor eax, eax  ; Konvensi pemanggilan printf (0 floating point arguments)

    ; Simpan nilai counter dan panggil printf
    push rbx
    call printf
    pop rbx

    ; Kurangi counter
    dec ebx
    
    ; Bandingkan dengan 0 dan lanjutkan loop jika lebih besar dari 0
    test ebx, ebx
    jg loop_start

    ; Epilogue
    pop rbx
    mov rsp, rbp
    pop rbp

    ; Return dari main
    xor eax, eax  ; Return 0
    ret