
.Model Small
.Stack 100h
.Data
    nhapA  db 'Hay nhap A: $'
    nhapB  db 'Hay nhap B: $'
    lonHon db ' lon hon $'
    nhoHon db ' nho hon $'
    bang   db ' bang $'
    soA    db 0
    soB    db 0
.Code


; break line and move 0
BreakLine Proc NEAR    
    mov ah, 02h
    mov dl, 10
    int 21h         ; breakline
    mov dl, 13
    int 21h         ; move cusor to start
    RET
BreakLine ENDP

    
; main
Main Proc
    mov ax, @Data
    mov ds, ax

    mov ah, 09h
    lea dx, nhapA
    int 21h        ; show nhapA
    
    mov ah, 01h
    int 21h        ; input
    sub al, 30h    ; ascii -> number
    mov soA, al    ; save soA
    
    call BreakLine
    
    mov ah, 09h
    lea dx, nhapB
    int 21h        ; show nhapA
    
    mov ah, 01h
    int 21h        ; input
    sub al, 30h    ; ascii -> number
    mov soB, al    ; save soA           
    
    call BreakLine
    
    ; test load so A & B qua offset
    lea bx, soA    ; bx -> address soA              
    mov al, [bx]   ; al -> *bx
    mov ah, 1[bx]  ; al -> *(bx + 0x01) 
                              
    ; phan chinh cua bai tap nay
    cmp al, ah
    
    ; ---- update ----
    
    mov ah, 4Ch
    int 21h
Main EndP  
End Main   