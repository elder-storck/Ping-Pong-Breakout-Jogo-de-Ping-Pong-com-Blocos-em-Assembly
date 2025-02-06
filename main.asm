; versão de 18/10/2022
; Uso de diretivas extern e global 
; Professor Camilo Diaz

extern line, full_circle, circle, cursor, caracter, plot_xy, 
global cor
global BALL_X,BALL_y

segment code



;org 100h
..start:
        MOV     AX,data			;Inicializa os registradores
    	MOV 	DS,AX
    	MOV 	AX,stack
    	MOV 	SS,AX
    	MOV 	SP,stacktop

        MOV     AX,[ballSpeed_X]
        MOV     [ballCompDirecao],AX
        MOV     [ballCompDirecaoNeg],AX
        NEG     word [ballCompDirecaoNeg]

;Salvar modo corrente de video(vendo como esta o modo de video da maquina)
        MOV  	AH,0Fh
    	INT  	10h
    	MOV  	[modo_anterior],AL   

;Alterar modo de video para grafico 640x480 16 cores
    	MOV     AL,12h
   		MOV     AH,0
    	INT     10h
		

;desenha limites
		MOV		byte [cor],branco_intenso	;linha inferior
		MOV		AX,40                   	;x1
		PUSH	AX
		MOV		AX,6                  		;y1
		PUSH	AX
		MOV		AX,600                 		;x2
		PUSH	AX
		MOV		AX,6                  		;y2
		PUSH	AX
		CALL	line

		MOV		byte [cor],branco_intenso	;linha inferior
		MOV		AX,40                   	;x1
		PUSH	AX
		MOV		AX,5                  		;y1
		PUSH	AX
		MOV		AX,600                 		;x2
		PUSH	AX
		MOV		AX,5                  		;y2
		PUSH	AX
		CALL	line


		MOV		byte [cor],branco_intenso	;linha superior
		MOV		AX,40                   	;x1
		PUSH	AX
		MOV		AX,474                 		;y1
		PUSH	AX
		MOV		AX,600                 		;x2
		PUSH	AX
		MOV		AX,474                 		;y2
		PUSH	AX
		CALL	line

		MOV		byte [cor],branco_intenso	;linha superior
		MOV		AX,40                   	;x1
		PUSH	AX
		MOV		AX,475                 		;y1
		PUSH	AX
		MOV		AX,600                 		;x2
		PUSH	AX
		MOV		AX,475                 		;y2
		PUSH	AX
		CALL	line



;desenhar blocos da esquerda

		MOV		byte [cor],vermelho		; bloco vermelho
        MOV		CX,20	

		bloco_vermelho_esquerda_loop:
        MOV		AX,1
        ADD		AX,CX            			;x1
        PUSH	AX
        MOV		AX,474             			;y1
        PUSH	AX
        MOV		AX,1
        ADD		AX,CX        				;x2
        PUSH	AX
        MOV		AX,390               		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_vermelho_esquerda_loop

		MOV		byte [cor],amarelo		; bloco amarelo
        MOV		CX,20						; repetir 20 vezes

		bloco_amarelo_esquerda_loop:
        MOV		AX,1
        ADD		AX,CX           			;x1
        PUSH	AX
        MOV		AX,378              		;y1
        PUSH	AX
        MOV		AX,1
        ADD		AX,CX        				;x2
        PUSH	AX
        MOV		AX,294                 		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_amarelo_esquerda_loop

		MOV		byte [cor],verde		; bloco verde
        MOV		CX,20						; repetir 20 vezes

		bloco_verde_esquerda_loop:
        MOV		AX,1
        ADD		AX,CX            			;x1
        PUSH	AX
        MOV		AX,282               		;y1
        PUSH	AX
        MOV		AX,1
        ADD		AX,CX        				;x2
        PUSH	AX
        MOV		AX,198                		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_verde_esquerda_loop

		MOV		byte [cor],azul_claro		; bloco azul claro 
        MOV		CX,20						; repetir 20 vezes

	bloco_azul_claro_esquerda_loop:
        MOV		AX,1
        ADD		AX,CX            			;x1
        PUSH	AX
        MOV		AX,186                		;y1
        PUSH	AX
        MOV		AX,1
        ADD		AX,CX       				;x2
        PUSH	AX
        MOV		AX,102                 		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_azul_claro_esquerda_loop

		MOV		byte [cor],azul				;bloco azul 
		MOV		CX,20						; repetir 20 vezes
	
	bloco_azul_esquerda_loop:
        MOV		AX,1
        ADD		AX,CX                    	;x1
        PUSH	AX
        MOV		AX,90                 		;y1
        PUSH	AX
        MOV		AX,1
        ADD		AX,CX                 		;x2
        PUSH	AX
        MOV		AX,6                 		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_azul_esquerda_loop


	;desenhar blocos da direita

		MOV		byte [cor],vermelho		; bloco vermelho
        MOV		CX,20						; repetir 20 vezes

		bloco_vermelho_direita_loop:
        MOV		AX,618
        ADD		AX,CX            			;x1
        PUSH	AX
        MOV		AX,474             			;y1
        PUSH	AX
        MOV		AX,618
        ADD		AX,CX         				;x2
        PUSH	AX
        MOV		AX,390               		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_vermelho_direita_loop

		MOV		byte [cor],amarelo		; bloco amarelo
        MOV		CX,20						; repetir 20 vezes

		bloco_amarelo_direita_loop:
        MOV		AX,618
        ADD		AX,CX           			;x1
        PUSH	AX
        MOV		AX,378              		;y1
        PUSH	AX
        MOV		AX,618
        ADD		AX,CX         				;x2
        PUSH	AX
        MOV		AX,294                 		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_amarelo_direita_loop

		MOV		byte [cor],verde		; bloco verde
        MOV		CX,20						; repetir 20 vezes

		bloco_verde_direita_loop:
        MOV		AX,618
        ADD		AX,CX          			;x1
        PUSH	AX
        MOV		AX,282               		;y1
        PUSH	AX
        MOV		AX,618
        ADD		AX,CX       				;x2
        PUSH	AX
        MOV		AX,198               		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_verde_direita_loop

		MOV		byte [cor],azul_claro		; bloco azul claro 
        MOV		CX,20						; repetir 20 vezes

	bloco_azul_claro_direita_loop:
        MOV		AX,618
        ADD		AX,CX          				;x1
        PUSH	AX
        MOV		AX,186                		;y1
        PUSH	AX
        MOV		AX,618
        ADD		AX,CX        				;x2
        PUSH	AX
        MOV		AX,102                		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_azul_claro_direita_loop

		MOV		byte [cor],azul				;bloco azul 
		MOV		CX,20						; repetir 20 vezes
	
	bloco_azul_direita_loop:
        MOV		AX,618
        ADD		AX,CX                     	;x1
        PUSH	AX
        MOV		AX,90                 		;y1
        PUSH	AX
        MOV		AX,618
        ADD		AX,CX                 		;x2
        PUSH	AX
        MOV		AX,6                 		;y2
        PUSH	AX
        CALL	line
        LOOP	bloco_azul_direita_loop

	

    
    DRAW_BALL:

    ;=========================== Lendo As Teclas =================================
    
    MOV AH, 01H     ; Verifica se há tecla no buffer do teclado
    INT 16H       
    JZ  NAO_TEM     ; Se ZF estiver definido, nenhuma tecla foi pressionada
    MOV AH, 00H     ; Se houver tecla, lê a tecla pressionada
    INT 16H       

    ;=========================== Verificando As Teclas ===========================
    
    ; Verifica tecla W (Mover para cima)
    cmp ah, 11h
    jne W_Verificado
        MOV AX,2
        ADD [raqueteEsq_y1],AX
        jnp Remove_Raquete_Esq
    W_Verificado: 

    ; Verifica tecla S (Mover para baixo)
    cmp ah, 1Fh  
    jne S_Verificado
        MOV AX,2
        SUB [raqueteEsq_y1],AX
        MOV AX,84
        ADD [raqueteEsq_y_old],AX
        jnp Remove_Raquete_Esq
    S_Verificado:   

    ; Verifica tecla Seta Cima
    cmp ah, 48h  
    jne SetaSubir_Verificado
        MOV AX,2
        ADD [raqueteDir_y1],AX
        jnp Remove_Raquete_Dir
    SetaSubir_Verificado:   

    ; Verifica tecla Seta Baixo
    cmp ah, 50h  
    jne SetaDescer_Verificado
        MOV AX,2
        SUB [raqueteDir_y1],AX
        MOV AX,84
        ADD [raqueteDir_y_old],AX
        jnp Remove_Raquete_Dir
    SetaDescer_Verificado:

    NAO_TEM:        ; Continua a execução normal do programa

    ;=========================== Apagando a Raquete =================================

    Remove_Raquete_Dir:
    MOV		byte [cor],preto	        ; bloco magenta claro
	MOV		CX,2						; repetir 2 vezes

    apagando_raquete_direita_loop:
        MOV		AX,[raqueteDir_x1]                   	;x1
        PUSH	AX
        MOV     BX,[raqueteDir_y_old]
        PUSH	BX
        MOV		AX,[raqueteDir_x2]                  	;x2
        PUSH	AX
        MOV     BX,[raqueteDir_y_old]                 	;y
        PUSH	BX
        CALL	line
        MOV     AX,1
        ADD     [raqueteDir_y_old],AX
        LOOP	apagando_raquete_direita_loop

    Remove_Raquete_Esq:
    MOV		byte [cor],preto	        ; bloco azul
    MOV		CX,2						; repetir 84 vezes
    apagando_raquete_esquerda_loop:
        MOV		AX,[raqueteEsq_x1]                  	;x1
        PUSH	AX
        MOV     BX,[raqueteEsq_y_old]
        PUSH    BX
        MOV		AX,[raqueteEsq_x2]                  	;x2
        PUSH	AX
        MOV     BX,[raqueteEsq_y_old]
        PUSH	BX
        CALL	line
        MOV     AX,1
        ADD     [raqueteEsq_y_old],AX
        LOOP	apagando_raquete_esquerda_loop


    ;=========================== Plotando as raquetes =================================


    MOV		byte [cor],magenta	        ; bloco magenta claro
	MOV		CX,84						; repetir 2 vezes

    raquete_direita_loop:
        MOV		AX,[raqueteDir_x1]                   	
        PUSH	AX
        MOV		AX,[raqueteDir_y1]
        ADD		AX,CX                 		
        PUSH	AX
        MOV		AX,[raqueteDir_x2]                  	
        PUSH	AX
        MOV		AX,[raqueteDir_y1]
        ADD		AX,CX                 		
        PUSH	AX
        CALL	line
        LOOP	raquete_direita_loop

    MOV		byte [cor],azul	            ; bloco azul
    MOV		CX,85						; repetir 84 vezes

    raquete_esquerda_loop:
        MOV		AX,[raqueteEsq_x1]                  	;x1
        PUSH	AX
        MOV		AX,[raqueteEsq_y1]
        ADD		AX,CX                 		;y1
        PUSH	AX
        MOV		AX,[raqueteEsq_x2]                  		;x2
        PUSH	AX
        MOV		AX,[raqueteEsq_y1]
        ADD		AX,CX                 		;y2
        PUSH	AX
        CALL	line
        LOOP	raquete_esquerda_loop

    


    ;=========================== Setando coordenada da raquete para apagar =================================
    MOV AX,[raqueteDir_y1]
    MOv [raqueteDir_y_old],AX
    MOV AX,[raqueteEsq_y1]
    MOV [raqueteEsq_y_old],AX


    ;=========================== bolinha =================================


        ;Apagando Rastro da Bola = plotando uma bola preta
		MOV		byte [cor],preto			
		MOV		AX,[ball_x_old]
		PUSH	AX
		MOV		AX,[ball_Y_old]
		PUSH	AX
		MOV		AX,15
		PUSH	AX
		CALL	circle

        ;Plotando a Bola
        MOV		byte [cor],verde	;Cor
		MOV		AX,[BALL_X]         ;Coordenada X
		PUSH	AX
		MOV		AX,[BALL_Y]         ;Coordenada Y
		PUSH	AX
		MOV		AX,15               ;Tamanho
		PUSH	AX
		CALL	circle              ;Executando Plot da bola

        ;Movimentando a Bolinha

        MOV AX,[BALL_X]             ;Definindo coordenadas a serem apagadas (X)
        MOV [ball_x_old],AX         ;Coordenadas da bola preta que apaga o rastro da verde
        MOV AX,[BALL_Y]             ;Definindo coordenadas a serem apagadas (Y)
        MOV [ball_Y_old],AX         ;Coordenadas da bola preta que apaga o rastro da verde



        ;=================Colisão em X - Bordas do campo =================

        ;if(BALL_X < 0)   ballSpeed_X = (ballSpeed_X)*(-1)
        MOV AX,15
        CMP AX,[BALL_X]
        JL DentroDoCampoEsq
            NEG word [ballSpeed_X]
        DentroDoCampoEsq:
          
        ;if(BALL_X > 640) ballSpeed_X = (ballSpeed_X)*(-1)
        MOV AX,625
        CMP [BALL_X],AX
        JL DentroDoCampoDir
            NEG word [ballSpeed_X]
        DentroDoCampoDir:

        MOV AX,[ballSpeed_X]
        ADD [BALL_X],AX

        ;=================Colisão em Y - Bordas do campo =================

        ;if(BALL_Y < 0)   ballSpeed_Y = (ballSpeed_Y)*(-1)
        MOV AX,21
        CMP AX,[BALL_Y]
        JL DentroDoCampoBaixo
            NEG word [ballSpeed_Y]
        DentroDoCampoBaixo:
          
        ;if(BALL_Y > 480) ballSpeed_Y = (ballSpeed_Y)*(-1)
        MOV AX,459
        CMP [BALL_Y],AX
        JL DentroDoCampoAlto
            NEG word [ballSpeed_Y]
        DentroDoCampoAlto:

        MOV AX,[ballSpeed_Y]
        ADD [BALL_Y],AX

    ;================= Colisão na raquete Direita ====================

    MOv AX,[raqueteDir_x1]                          ;x1 da raquete
    SUB AX,15                                       ;Raio da bolinha
    CMP [BALL_X],AX                                 ;Compara se Ball_x < raquete_x
    JL  PularComparacaoRaqueteDir                   ;Se Ball_x < raquete_x => sem colisão   
        MOV AX,[ballSpeed_X]
        CMP [ballCompDirecaoNeg],AX                 ;não colide se a bolinha estiver indo para esquerda
        JE  PularComparacaoRaqueteDir
            MOV AX,[raqueteDir_y1]
            CMP AX,[BALL_Y]                             ;Verifica se a bola está aabixo da parte de baixo da raquete
            JG PularComparacaoRaqueteDir                  ;Se a bola estiver abaixo => Pula colisão      
                MOV AX,[raqueteDir_y1]
                ADD word AX,84
                CMP AX,[BALL_Y]                         ;Verifica se a bola está mais alto que a parte alta da raquete   
                JL PularComparacaoRaqueteDir              ;Se a bola estiver mais alto => Pula colisão
                    NEG word [ballSpeed_X]        
    PularComparacaoRaqueteDir:
    ;================= Colisão na raquete Esquerda ====================

    MOv AX,[raqueteEsq_x2]                          ;x1 da raquete
    ADD AX,15                                       ;Raio da bolinha
    CMP [BALL_X],AX                                 ;Compara se Ball_x < raquete_x
    JG  PularComparacaoRaqueteEsq                   ;Se Ball_x < raquete_x => sem colisão
        MOV AX,[ballSpeed_X]                        ;Não colide se a bolinha estiver indo para esquerda
        CMP [ballCompDirecao],AX
        JE  PularComparacaoRaqueteEsq
            MOV AX,[raqueteEsq_y1]
            CMP AX,[BALL_Y]                             ;Verifica se a bola está aabixo da parte de baixo da raquete
            JG PularComparacaoRaqueteEsq                  ;Se a bola estiver abaixo => Pula colisão
                MOV AX,[raqueteEsq_y1]
                ADD word AX,84
                CMP AX,[BALL_Y]                         ;Verifica se a bola está mais alto que a parte alta da raquete
                JL PularComparacaoRaqueteEsq              ;Se a bola estiver mais alto => Pula colisão                    
                    NEG word [ballSpeed_X]
    PularComparacaoRaqueteEsq:
    


    ;================= Colisão  - Blocos lado direito =================
      
        MOV AX,603                                  ;Verificando if(coordenada_x < 603) Pula o check_Colisao_Direita
        CMP [BALL_X],AX
        JL PularComparacao_Y1                       ;Final da check_Colisao_direita

            MOV AX,96                               ;testando se Y>0 e Y<96 (Dentro do Bloco 01)
            CMP AX,[BALL_Y]                         ;Compara Y<96
            JL PularComparacaoBloco_1               ;Se      Y>96  Pula o check colisão no bloco 01
                CMP word [blocoAtivoDir_1],0        ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBloco_1                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide
                    MOV		byte [cor],preto	    ;Apagando o Bloco
                    MOV		CX,20				    
                    ApagaBloco_1:
                    MOV		AX,618                  ;X1                
                    ADD		AX,CX                   
                    PUSH	AX
                    MOV		AX,90                 	;Y1
                    PUSH	AX
                    MOV		AX,618                  ;X2
                    ADD		AX,CX                 
                    PUSH	AX
                    MOV		AX,6                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBloco_1

                NaoApagaBloco_1:
                MOV word [blocoAtivoDir_1],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacao_Y
            PularComparacaoBloco_1:

            MOV AX,192                              ;testando se Y>96 e Y<192 (Dentro do Bloco 02)
            CMP AX,[BALL_Y]                         ;Compara Y<192
            JL PularComparacaoBloco_2               ;Se      Y>192  Pula o check colisão no bloco 02
                CMP word [blocoAtivoDir_2],0        ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBloco_2                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20				
                    ApagaBloco_2:
                    MOV		AX,618                  ;X1
                    ADD		AX,CX                    
                    PUSH	AX
                    MOV		AX,186                 	;Y1
                    PUSH	AX
                    MOV		AX,618                  ;X2
                    ADD		AX,CX                 	
                    PUSH	AX
                    MOV		AX,102                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBloco_2

                NaoApagaBloco_2:
                MOV word [blocoAtivoDir_2],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacao_Y
            PularComparacaoBloco_2:

            PularComparacao_Y1:                     ;Alomgando o Jump
            MOV AX,603                              ;Mesma comparacao
            CMP [BALL_X],AX                         
            JL PularComparacao_Y2                   ;outro alomgamento de jump

            MOV AX,288                              ;testando se Y>192 e Y<288 (Dentro do Bloco 03)
            CMP AX,[BALL_Y]                         ;Compara Y<288
            JL PularComparacaoBloco_3               ;Se      Y>288  Pula o check colisão no bloco 03
                CMP word [blocoAtivoDir_3],0      ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBloco_3                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20					
                    ApagaBloco_3:
                    MOV		AX,618                  ;X1
                    ADD		AX,CX                    
                    PUSH	AX
                    MOV		AX,282                 	;Y1
                    PUSH	AX
                    MOV		AX,618                  ;X2
                    ADD		AX,CX                 		
                    PUSH	AX
                    MOV		AX,198                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBloco_3

                NaoApagaBloco_3:
                MOV word [blocoAtivoDir_3],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacao_Y
            PularComparacaoBloco_3:

            MOV AX,384                              ;testando se Y>288 e Y<384 (Dentro do Bloco 04)
            CMP AX,[BALL_Y]                         ;Compara Y<384
            JL PularComparacaoBloco_4               ;Se      Y>384  Pula o check colisão no bloco 04
                CMP word [blocoAtivoDir_4],0      ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBloco_4                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20					
                    ApagaBloco_4:
                    MOV		AX,618                  ;X1
                    ADD		AX,CX                   
                    PUSH	AX
                    MOV		AX,378                 	;Y1
                    PUSH	AX
                    MOV		AX,618                  ;X1
                    ADD		AX,CX                 
                    PUSH	AX
                    MOV		AX,294                 	;Y1
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBloco_4

                NaoApagaBloco_4:
                MOV word [blocoAtivoDir_4],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacao_Y
            PularComparacaoBloco_4:

            PularComparacao_Y2:                     ;Alomgando o Jump
            MOV AX,603                              ;Mesma comparacao
            CMP [BALL_X],AX                         
            JL PularComparacao_Y                    ;outro alomgamento de jump

            MOV AX,488                              ;testando se Y>384 e Y<488 (Dentro do Bloco 05)
            CMP AX,[BALL_Y]                         ;Compara Y<488
            JL PularComparacaoBloco_5               ;Se      Y>488  Pula o check colisão no bloco 05
                CMP word [blocoAtivoDir_5],0      ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBloco_5                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20					
                    ApagaBloco_5:
                    MOV		AX,618                  ;X1
                    ADD		AX,CX                   
                    PUSH	AX
                    MOV		AX,474                  ;Y1
                    PUSH	AX
                    MOV		AX,618                  ;X2
                    ADD		AX,CX                 	
                    PUSH	AX
                    MOV		AX,390                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBloco_5

                NaoApagaBloco_5:
                MOV word [blocoAtivoDir_5],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
            PularComparacaoBloco_5:

            NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
            ;MOV AX,[ballSpeed_X]                    ;Adiciona um valor a coordenada X da Bola
            ;ADD [BALL_X],AX
        PularComparacao_Y:


    ;================= Colisão  - Blocos lado Esquerdo =================
      
        MOV AX,35                                   ;Verificando if(coordenada_x > 35) Pula o check_Colisao_Esquerda
        CMP AX,[BALL_X]
        JL PularComparacaoEsq_Y1                    ;Final da check_Colisao_direita

            MOV AX,96                               ;testando se Y>0 e Y<96 (Dentro do Bloco 01)
            CMP AX,[BALL_Y]                         ;Compara Y<96
            JL PularComparacaoBlocoEsq_1               ;Se      Y>96  Pula o check colisão no bloco 01
                CMP word [blocoAtivoEsq_1],0        ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBlocoEsq_1                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide
                    MOV		byte [cor],preto	    ;Apagando o Bloco
                    MOV		CX,20				    
                    ApagaBlocoEsq_1:
                    MOV		AX,1                  ;X1                
                    ADD		AX,CX                   
                    PUSH	AX
                    MOV		AX,90                 	;Y1
                    PUSH	AX
                    MOV		AX,1                  ;X2
                    ADD		AX,CX                 
                    PUSH	AX
                    MOV		AX,6                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBlocoEsq_1

                NaoApagaBlocoEsq_1:
                MOV word [blocoAtivoEsq_1],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacaoEsq_Y
            PularComparacaoBlocoEsq_1:

            MOV AX,192                              ;testando se Y>96 e Y<192 (Dentro do Bloco 02)
            CMP AX,[BALL_Y]                         ;Compara Y<192
            JL PularComparacaoBlocoEsq_2               ;Se      Y>192  Pula o check colisão no bloco 02
                CMP word [blocoAtivoEsq_2],0        ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBlocoEsq_2                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20				
                    ApagaBlocoEsq_2:
                    MOV		AX,1                    ;X1
                    ADD		AX,CX                    
                    PUSH	AX
                    MOV		AX,186                 	;Y1
                    PUSH	AX
                    MOV		AX,1                    ;X2
                    ADD		AX,CX                 	
                    PUSH	AX
                    MOV		AX,102                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBlocoEsq_2

                NaoApagaBlocoEsq_2:
                MOV word [blocoAtivoEsq_2],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacaoEsq_Y
            PularComparacaoBlocoEsq_2:

            PularComparacaoEsq_Y1:                     ;Alomgando o Jump
            MOV AX,35                                   ;Verificando if(coordenada_x > 35) Pula o check_Colisao_Esquerda
            CMP AX,[BALL_X]                        
            JL PularComparacaoEsq_Y2                   ;outro alomgamento de jump

            MOV AX,288                              ;testando se Y>192 e Y<288 (Dentro do Bloco 03)
            CMP AX,[BALL_Y]                         ;Compara Y<288
            JL PularComparacaoBlocoEsq_3               ;Se      Y>288  Pula o check colisão no bloco 03
                CMP word [blocoAtivoEsq_3],0      ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBlocoEsq_3                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20					
                    ApagaBlocoEsq_3:
                    MOV		AX,1                    ;X1
                    ADD		AX,CX                    
                    PUSH	AX
                    MOV		AX,282                 	;Y1
                    PUSH	AX
                    MOV		AX,1                    ;X2
                    ADD		AX,CX                 		
                    PUSH	AX
                    MOV		AX,198                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBlocoEsq_3

                NaoApagaBlocoEsq_3:
                MOV word [blocoAtivoEsq_3],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacaoEsq_Y
            PularComparacaoBlocoEsq_3:

            MOV AX,384                              ;testando se Y>288 e Y<384 (Dentro do Bloco 04)
            CMP AX,[BALL_Y]                         ;Compara Y<384
            JL PularComparacaoBlocoEsq_4               ;Se      Y>384  Pula o check colisão no bloco 04
                CMP word [blocoAtivoEsq_4],0      ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBlocoEsq_4                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20					
                    ApagaBlocoEsq_4:
                    MOV		AX,1                    ;X1
                    ADD		AX,CX                   
                    PUSH	AX
                    MOV		AX,378                 	;Y1
                    PUSH	AX
                    MOV		AX,1                    ;X1
                    ADD		AX,CX                 
                    PUSH	AX
                    MOV		AX,294                 	;Y1
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBlocoEsq_4

                NaoApagaBlocoEsq_4:
                MOV word [blocoAtivoEsq_4],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
                JMP PularComparacaoEsq_Y
            PularComparacaoBlocoEsq_4:

            PularComparacaoEsq_Y2:                     ;Alomgando o Jump
            MOV AX,35                                   ;Verificando if(coordenada_x > 35) Pula o check_Colisao_Esquerda
            CMP AX,[BALL_X]                         
            JL PularComparacaoEsq_Y                   ;outro alomgamento de jump

            MOV AX,488                              ;testando se Y>384 e Y<488 (Dentro do Bloco 05)
            CMP AX,[BALL_Y]                         ;Compara Y<488
            JL PularComparacaoBlocoEsq_5               ;Se      Y>488  Pula o check colisão no bloco 05
                CMP word [blocoAtivoEsq_5],0      ;Verifica se o bloco tá ativo(aceso)
                JE NaoApagaBlocoEsq_5                  ;Se o bloco não tá ativo => pula e não apaga o bloco e nem colide

                    MOV		byte [cor],preto	    ;Apagando Bloco
                    MOV		CX,20					
                    ApagaBlocoEsq_5:
                    MOV		AX,1                    ;X1
                    ADD		AX,CX                   
                    PUSH	AX
                    MOV		AX,474                  ;Y1
                    PUSH	AX
                    MOV		AX,1                    ;X2
                    ADD		AX,CX                 	
                    PUSH	AX
                    MOV		AX,390                 	;Y2
                    PUSH	AX
                    CALL	line
                    LOOP	ApagaBlocoEsq_5

                NaoApagaBlocoEsq_5:
                MOV word [blocoAtivoEsq_5],0
                NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
            PularComparacaoBlocoEsq_5:

            ;NEG word [ballSpeed_X]                  ;Troca sentido o sentido que a bola está indo
            ;MOV AX,[ballSpeed_X]                    ;Adiciona um valor a coordenada X da Bola
            ;ADD [BALL_X],AX
        PularComparacaoEsq_Y:






        ;Adicionando Delay para o movimento
		MOV AH, 2Ch                 ;Função 2Ch do DOS: Get System Time
		INT 21h                     ;CH = horas, CL = minutos, DH = segundos, DL = centésimos
		MOV [TIME_AUX], DL

		Verifica_Tempo:
			mov ah, 2Ch             ;Função 2Ch do DOS: Get System Time
    		int 21h                 ;CH = horas, CL = minutos, DH = segundos, DL = centésimos

			; Comparar com o tempo inicial
			cmp DL, [TIME_AUX]      ;Compara o Tempo guardado com o tempo coletado
    		je Verifica_Tempo       ;Enquanto os tempos forem iguais => volta para comparação, quando diferentes é pq passou uma unidade de tempo.
		
		MOV [TIME_AUX],DL           ;Quardando o tempo atual para comparação futura.

    JMP DRAW_BALL                   ;Voltando para o ciclo que plota a bolinha


	MOV    	AH,08h
	INT     21h
	MOV  	AH,0   						; set video mode
    MOV  	AL,[modo_anterior]   		; modo anterior
	INT  	10h
	MOV     AX,4c00h
	INT     21h


	
;*******************************************************************

segment data

bola dw 320, 240, 25

raquete_esquerda dw 31,282,51,198

raquete_direita_x1 dw 588
raquete_direita_y1 dw 282
raquete_direita_x2 dw 608
raquete_direita_y2 dw 198

old_int9 dw 0



cor		db		branco_intenso

;	I R G B COR
;	0 0 0 0 preto
;	0 0 0 1 azul
;	0 0 1 0 verde
;	0 0 1 1 cyan
;	0 1 0 0 vermelho
;	0 1 0 1 magenta
;	0 1 1 0 marrom
;	0 1 1 1 branco
;	1 0 0 0 cinza
;	1 0 0 1 azul claro
;	1 0 1 0 verde claro
;	1 0 1 1 cyan claro
;	1 1 0 0 rosa
;	1 1 0 1 magenta claro
;	1 1 1 0 amarelo
;	1 1 1 1 branco intenso

preto		    equ		0
azul		    equ		1
verde		    equ		2
cyan		    equ		3
vermelho	    equ		4
magenta		    equ		5
marrom		    equ		6
branco		    equ		7
cinza		    equ		8
azul_claro	    equ		9
verde_claro	    equ		10
cyan_claro	    equ		11
rosa		    equ		12
magenta_claro	equ		13
amarelo		    equ		14
branco_intenso	equ		15

modo_anterior	db		0
linha   	    dw  	0
coluna  	    dw  	0
deltax		    dw		0
deltay		    dw		0	
mens    	    db  	'Funcao Grafica SE_I $' 

BALL_X          dw      40
BALL_Y          dw      40
TIME_AUX        dw      0
ballSpeed_X     dw      10
ballSpeed_Y     DW      10
ballCompDirecao DW      10
ballCompDirecaoNeg  DW  10
ball_x_old      dw      360 
ball_Y_old      dw      240
ball_direction_X    DW     1
ball_direction_Y    DW     1
ball_Radius         DW      15
raqueteEsq_x1 dw 31
raqueteEsq_y1 dw 197
raqueteEsq_x2 dw 51
raqueteEsq_y2 dw 197

raqueteDir_x1 dw 588
raqueteDir_y1 dw 197
raqueteDir_x2 dw 608
raqueteDir_y2 dw 197

raqueteEsq_y_old    dw  197
raqueteDir_y_old    dw  197
raqueteSpeed        dw  25

blocosAtivosDir     dw  1, 1, 1, 1, 1
blocosAtivosEsq     dw  1, 1, 1, 1, 1

blocoAtivoDir_1     dw  1
blocoAtivoDir_2     dw  1
blocoAtivoDir_3     dw  1
blocoAtivoDir_4     dw  1
blocoAtivoDir_5     dw  1

blocoAtivoEsq_1     dw  1
blocoAtivoEsq_2     dw  1
blocoAtivoEsq_3     dw  1
blocoAtivoEsq_4     dw  1
blocoAtivoEsq_5     dw  1

BlocosCoordenadas_X    dw  0,96,97,192,193,288,289,384,385,480  ;Y bloco 1(y1,y2), Y bloco 2(y1,y2), Y bloco 3(y1,y2), Y bloco 4(y1,y2), Y bloco 5(y1,y2) 
BlocosCoordenadas_Y    dw  1,20,618,638                         ;X da Dir (x1,x2), X da Esq(x1,x2)

;*************************************************************************
segment stack stack
		DW 		512
stacktop:
