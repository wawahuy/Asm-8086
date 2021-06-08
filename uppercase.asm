.Model Small
.Stack 100h
.Data
    Ycnhap db 'Hay go vao mot ki tu: $'   
    Tbao   db 'Chu cai hoa tuong ung la: $'
    saveT  db 0
    save   db 0
.Code
Main Proc
    mov ax, @Data       ; ax -> address data
    mov ds, ax          ; ds -> ax
    mov ah, 09h         ; ah -> 09h (hien chuoi)
    lea dx, Ycnhap      ; dx -> Ycnhap (offset string nhap) ds:dx
    int 21h
    
    mov ah, 01h         ; ah -> 01h (nhap ki tu>
    int 21h             ;
    
    sub al, 20h         ; al -> al - 20h (tinh ascii uppercase)
    mov save, al
           
    mov ah, 09h
    lea dx, Tbao
    int 21h
            
    lea bx, saveT
    mov dl, 1[bx]
    mov ah, 02h         ; ah -> 02h
    int 21h
    
    mov ah, 4Ch
    int 21h
    
Main EndP
End Main