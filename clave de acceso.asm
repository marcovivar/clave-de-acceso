;CLAVE DE ACCESO 

;Marco Vivar

;05/04/2021     




;ESTABLECER MODO DE VIDEO

MOV AH, 00H

MOV AL, 01H     ;RESOLUCION  40X25

INT 10H 

;LIMPIAR PANTALLA

MOV AH, 06H

MOV AL, 0H      ;LIMPIAR TODA LA PANTALLA

MOV BH, 1FH    ;ATRIBUTO

MOV CX, 00H     ;INICIALIZA RENG. COLUM.

MOV DL, 79      ;COLUM FINAL

MOV DH, 24      ;RENG FINAL

INT 10H 

;COLOCAR EL CURSOR PARA LA HORIZONTAL SUPERIOR

MOV AH, 02H

MOV BH, 0H      ;PAGINA ACTUAL

MOV DH, 5       ;FILA DONDE SE SITUA EL CURSOR  

MOV DL, 5       ;COLUMNA DONDE SE SITUA EL CURSOR

INT 10H

;HORIZONTAL SUPERIOR

MOV CL, 1       ;CL=1 

MOV DL, 0FH     ;MOVEMOS A DL EL CARCATER QUE SE VA A IMPRIMIR 
                    
HORIZONTAL_S:              

    CMP CL, 30      ;HACE LA COMPARACION, SI SON IGUALES LA BANDERA ZF=0, DE LO CONTRARIO ZF=1 
    
    JZ HORIZONTAL_INF    ;SALTA A LA ETIQUETA SALIR SI ZF=0
    
    MOV AH, 02H     ;SERVICIO QUE IMPRIME UN CARACTER 

    INT 21H
    
    INC CL          ;SE INCREMENTA CL EN 1
    
    JMP HORIZONTAL_S  ;SALTA A LA ETIQUETA SI AL ES IGUAL AL CARACTER    
 
    INT 21H     
    
HORIZONTAL_INF: 

    ;COLOCAR EL CURSOR PARA LA HORIZONTAL INFERIOR
    
    MOV AH, 02H
    
    MOV BH, 0H      ;PAGINA ACTUAL
    
    MOV DH, 14       ;FILA DONDE SE SITUA EL CURSOR  
    
    MOV DL, 5       ;COLUMNA DONDE SE SITUA EL CURSOR
    
    INT 10H 
    
    ;HORIZONTAL INFERIOR
    
    MOV CL, 1       ;CL=1 
    
    MOV DL, 0FH     ;MOVEMOS A DL EL CARCATER QUE SE VA A IMPRIMIR 
                    
    HORIZONTAL_I:              
    
        CMP CL, 30      ;HACE LA COMPARACION, SI SON IGUALES LA BANDERA ZF=0, DE LO CONTRARIO ZF=1 
        
        JZ LATERAL_IZ    ;SALTA A LA ETIQUETA SALIR SI ZF=0
        
        MOV AH, 02H     ;SERVICIO QUE IMPRIME UN CARACTER 
    
        INT 21H
        
        INC CL          ;SE INCREMENTA CL EN 1
        
        JMP HORIZONTAL_I  ;SALTA A LA ETIQUETA SI AL ES IGUAL AL CARACTER    
     
        INT 21H 
        
LATERAL_IZ: 
    
    ;LATERAL IZQUIERDA

    MOV CL, 1       ;CL=1 
                    
    LATERAL_I: 
        
        ;COLOCAR EL CURSOR PARA LA LATERAL IZQUIERDA
    
        MOV AH, 02H
        
        MOV BH, 0H      ;PAGINA ACTUAL
        
        MOV DH, AUX     ;FILA DONDE SE SITUA EL CURSOR  
        
        MOV DL, 5       ;COLUMNA DONDE SE SITUA EL CURSOR
        
        INT 10H  
        
        
                    

        CMP CL, 9      ;HACE LA COMPARACION, SI SON IGUALES LA BANDERA ZF=0, DE LO CONTRARIO ZF=1 
        
        JZ LATERAL_DER    ;SALTA A LA ETIQUETA SALIR SI ZF=0 
        
        MOV DL, 0FH     ;MOVEMOS A DL EL CARCATER QUE SE VA A IMPRIMIR
        
        MOV AH, 02H     ;SERVICIO QUE IMPRIME UN CARACTER 
    
        INT 21H
        
        INC CL          ;SE INCREMENTA CL EN 1 
        
        INC AUX          ;SE INCREMENTA AUX EN 1
        
        JMP LATERAL_I  ;SALTA A LA ETIQUETA SI AL ES IGUAL AL CARACTER    
 
        INT 21H 
    
LATERAL_DER: 

    ;LATERAL DERECHA

    MOV CL, 1       ;CL=1
    
    MOV AUX, 6 
                    
    LATERAL_D: 
        
        ;COLOCAR EL CURSOR PARA LA LATERAL DERCHA
    
        MOV AH, 02H
        
        MOV BH, 0H      ;PAGINA ACTUAL
        
        MOV DH, AUX     ;FILA DONDE SE SITUA EL CURSOR  
        
        MOV DL, 33       ;COLUMNA DONDE SE SITUA EL CURSOR
        
        INT 10H  
        
        
                    

        CMP CL, 9      ;HACE LA COMPARACION, SI SON IGUALES LA BANDERA ZF=0, DE LO CONTRARIO ZF=1 
        
        JZ MENSAJE    ;SALTA A LA ETIQUETA SALIR SI ZF=0 
        
        MOV DL, 0FH     ;MOVEMOS A DL EL CARCATER QUE SE VA A IMPRIMIR
        
        MOV AH, 02H     ;SERVICIO QUE IMPRIME UN CARACTER 
    
        INT 21H
        
        INC CL          ;SE INCREMENTA CL EN 1 
        
        INC AUX          ;SE INCREMENTA AUX EN 1
        
        JMP LATERAL_D  ;SALTA A LA ETIQUETA SI AL ES IGUAL AL CARACTER    
 
        INT 21H 

;COLOCAR EL CURSOR PARA EL MENSAJE

MENSAJE:

    MOV AH, 02H
    
    MOV BH, 0H      ;PAGINA ACTUAL
    
    MOV DH, 7       ;FILA DONDE SE SITUA EL CURSOR  
    
    MOV DL, 12      ;COLUMNA DONDE SE SITUA EL CURSOR
    
    INT 10H
    
    ;ESCRIBIR MENSAJE
    
    MOV AH, 09H
    
    MOV DX, OFFSET MSG
    
    INT 21H 
    
    
    ;COLOCAMOS EL CURSOR EN EL PUNTO DESEADO PARA LEER POSTERIORMENTE
    
    MOV AH, 02H

    MOV BH, 0H      ;PAGINA ACTUAL
    
    MOV DH, 9       ;FILA DONDE SE SITUA EL CURSOR  
    
    MOV DL, 18      ;COLUMNA DONDE SE SITUA EL CURSOR
    
    INT 10H
    
    ;Se lee la cadena ingresada
     
    MOV AH, 0AH 
    
    MOV DX, OFFSET CADE
    
    INT 21H 
    
    
    ;se compara el primer caracter de la cadena con 1 para que sea correcta
    
    MOV AL, CADE[2] 
    
    CMP AL, '1'            
    
    JE COMP2 
             
                      
    CMP AL,'2'
    
    JE ERROR           
          
    
    CMP AL,'3'
    
    JE ERROR
    
    
    CMP AL,'4'
    
    JE ERROR
    
    
    CMP AL,'5'
    
    JE ERROR
    
    
    CMP AL,'6'
    
    JE ERROR
    
    
    CMP AL,'7'
    
    JE ERROR
          
    
    CMP AL,'8'
    
    JE ERROR 
    
    
    CMP AL,'9'
    
    JE ERROR
    
          
    COMP2:
    
        MOV AL, CADE[3]
        
         
        CMP AL, '2'
        
        JE COMP3
        
        
        CMP AL,'1'
        
        JE ERROR           
              
        
        CMP AL,'3'
        
        JE ERROR
        
        
        CMP AL,'4'
        
        JE ERROR
        
        
        CMP AL,'5'
        
        JE ERROR
        
        
        CMP AL,'6'
        
        JE ERROR
        
        
        CMP AL,'7'
        
        JE ERROR
              
        
        CMP AL,'8'
        
        JE ERROR 
        
        
        CMP AL,'9'
        
        JE ERROR 
        
        
    COMP3:
    
        MOV AL, CADE[4] 
        
        
        CMP AL, 3
        
        JE COMP4
        
        
        CMP AL,'2'
        
        JE ERROR           
              
        
        CMP AL,'1'
        
        JE ERROR
        
        
        CMP AL,'4'
        
        JE ERROR
        
        
        CMP AL,'5'
        
        JE ERROR
        
        
        CMP AL,'6'
        
        JE ERROR
        
        
        CMP AL,'7'
        
        JE ERROR
              
        
        CMP AL,'8'
        
        JE ERROR 
        
        
        CMP AL,'9'
        
        JE ERROR
        
        
       
    COMP4:
        
        MOV AL, CADE[5] 
        
        
        CMP AL, '4'    
        
        JE BIENVENIDO
        
        
        CMP AL,'2'
        
        JE ERROR           
              
        
        CMP AL,'3'
        
        JE ERROR
        
        
        CMP AL,'1'
        
        JE ERROR
        
        
        CMP AL,'5'
        
        JE ERROR
        
        
        CMP AL,'6'
        
        JE ERROR
        
        
        CMP AL,'7'
        
        JE ERROR
              
        
        CMP AL,'8'
        
        JE ERROR 
        
        
        CMP AL,'9'
        
        JE ERROR
        
    
    
    BIENVENIDO:
    
        ;colocar el cusor para el mensaje
        
        MOV AH,002H
        
        MOV BX,0
        
        MOV DH, 11
        
        MOV DL, 6
        
        INT 10H  
        
        ;LIMPIAR PANTALLA

        MOV AH, 006H
        
        MOV BH, 1AH 
        
        MOV CL, 6   ;COLUM INICIAL
        
        MOV CH, 11  ;RENG INICIAL
        
        MOV DL, 32  ;COLUM FINAL
        
        MOV DH, 11  ;RENG FINAL
        
        INT 10H 
        
        ;SE MUESTRA MENSAJE PERTINENTE 
         
        MOV AH,009H
        
        MOV DX, OFFSET MSJBIEN
        
        INT 21H
        
        JE SALIR
        
    
    ERROR:
     
        ;colocar el cusor para el mensaje
        
        MOV AH,002H
        
        MOV BX,0
        
        MOV DH, 11
        
        MOV DL, 12
        
        INT 10H 
        
        ;LIMPIAR PANTALLA

        MOV AH, 006H
        
        MOV BH, 1CH 
        
        MOV CL, 6   ;COLUM INICIAL
        
        MOV CH, 11  ;RENG INICIAL
        
        MOV DL, 32  ;COLUM FINAL
        
        MOV DH, 11  ;RENG FINAL
        
        INT 10H 
 
        ;SE MUESTRA MENSAJE PERTINENTE 
         
        MOV AH,009H
        
        MOV DX, OFFSET MSJMAL
        
        INT 21H  
        
        JE SALIR    
    
    
       

SALIR:

;REGRESA EL CONTROL AL SISTEMA OPERATIVO

INT 20H

;MENSAJE

MSG DB "ESCRIBA LA CLAVE$"  

AUX DB 6 

;05H: FORZAMOS AL USUARIO A SOLO INGRESAR 4 CARACTERES 

CADE DB 05H, 00, 08H DUP ('$')  

MSJBIEN DB "Bienvenido, Datos Correctos$"  

MSJMAL DB "Datos Invalidos $" 