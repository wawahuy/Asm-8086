;; Chuong trinh cong 2 so a & b
;; a va b la so co 1 chu so

.Model Small
.Stack 100h
.Data
    hkdx  db 'cong 2 chu so co 1 chu so! $'
    que   db 'Hay nhap so thu $'
    queA  db '1: $'
    queB  db '2: $'
    total db 0
    
.Code
Main Proc
    mov ax, @Data
    mov ds, ax
    
    ; print setup ... (09/int21h)     
    mov ah, 09h
    lea dx, hkdx
    int 21h
        
    ; break & start line                   
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
              
    ; print queA
    mov ah, 09h  
    lea dx, que
    int 21h
    lea dx, queA
    int 21h 
    
    ; input
    mov ah, 01h
    int 21h
                          
    ; convert ascii to number
    sub al, 30h
                          
    ; save input 1 to bx  
    mov total, al
    
    ; break & start line                   
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
              
    ; print queB
    mov ah, 09h  
    lea dx, que
    int 21h
    lea dx, queB
    int 21h
    
    ; inputB
    mov ah, 01h
    int 21h
    
    ; convert ascii to number
    sub al, 30h
            
    ; add
    mov bl, total
    add bl, al
    
    ; break & start line                   
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    ; convert number to ascii
    add bl, 30h
    
    ; show
    mov ah, 02h
    mov dl, bl
    int 21h
    
    
    mov ah, 4Ch
    int 21h
    
Main EndP
End Main