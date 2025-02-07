;Elder , Guilherme Dayrell Cruz Soares e Pedro Antônio Rosa de Souza

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
		
; Escrever o Menu
        CALL    exibir_menu

; Loop de interação
        CALL    selecionar_opcao


;GAmbiarra para apagar menu
        MOV		byte [cor],preto		; bloco preto
        MOV		CX,150	

		Apaga_menu:
        MOV		AX,200
        ADD		AX,CX            			;x1
        PUSH	AX
        MOV		AX,390             			;y1
        PUSH	AX
        MOV		AX,200
        ADD		AX,CX        				;x2
        PUSH	AX
        MOV		AX,250               		;y2
        PUSH	AX
        CALL	line
        LOOP	Apaga_menu


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

; Desenhar raquete direita
MOV byte [cor], azul   ; Define a cor azul para a raquete direita
MOV CX, 0             ; Iniciar contador de altura (varredura vertical)

raquete_direita_loop:
    MOV DX, 0         ; Iniciar contador de largura

    raquete_direita_largura_loop:
        MOV AX, [raquete_direita]      ; x1
        ADD AX, DX                      ; Ajusta x1 horizontalmente
        PUSH AX
        MOV AX, [raquete_direita+2]    ; y1
        ADD AX, CX                      ; Ajusta y1 verticalmente
        PUSH AX
        MOV AX, [raquete_direita]      ; x2
        ADD AX, DX                      ; Ajusta x2 (mesmo x1 pois é pixel único)
        PUSH AX
        MOV AX, [raquete_direita+2]    ; y2
        ADD AX, CX                      ; Ajusta y2 (mesmo y1 pois é pixel único)
        PUSH AX
        CALL line

        INC DX                          ; Incrementa contador de largura
        CMP DX, 20                        ; Largura da raquete
        JL raquete_direita_largura_loop

    INC CX                              ; Incrementa contador de altura
    CMP CX, 84                          ; Altura da raquete
    JL raquete_direita_loop

; Desenhar raquete esquerda
MOV byte [cor], magenta  ; Define a cor magenta para a raquete esquerda
MOV CX, 0                ; Reiniciar contador de altura

raquete_esquerda_loop:
    MOV DX, 0         ; Iniciar contador de largura

    raquete_esquerda_largura_loop:
        MOV AX, [raquete_esquerda]      ; x1
        ADD AX, DX                      ; Ajusta x1 horizontalmente
        PUSH AX
        MOV AX, [raquete_esquerda+2]    ; y1
        ADD AX, CX                      ; Ajusta y1 verticalmente
        PUSH AX
        MOV AX, [raquete_esquerda]      ; x2
        ADD AX, DX                      ; Ajusta x2 (mesmo x1 pois é pixel único)
        PUSH AX
        MOV AX, [raquete_esquerda+2]    ; y2
        ADD AX, CX                      ; Ajusta y2 (mesmo y1 pois é pixel único)
        PUSH AX
        CALL line

        INC DX                          ; Incrementa contador de largura
        CMP DX, 20                       ; Largura da raquete
        JL raquete_esquerda_largura_loop

    INC CX                              ; Incrementa contador de altura
    CMP CX, 84                          ; Altura da raquete
    JL raquete_esquerda_loop

	

    
    main_loop:

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

        ;CALL DRAW_BALL_FUNCTION
        ;CALL ball
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
        MOV AX,10
        ADD AX,[ball_Radius]
        CMP AX,[BALL_Y]
        JL DentroDoCampoBaixo
            NEG word [ballSpeed_Y]
        DentroDoCampoBaixo:
          
        ;if(BALL_Y > 480) ballSpeed_Y = (ballSpeed_Y)*(-1)
        MOV AX,470
        SUB AX,[ball_Radius]
        CMP [BALL_Y],AX
        JL DentroDoCampoAlto
            NEG word [ballSpeed_Y]
        DentroDoCampoAlto:

        MOV AX,[ballSpeed_Y]
        ADD [BALL_Y],AX


		 ;================= Colisão na raquete Direita ====================

    MOv AX,[raquete_direita]                          ;x1 da raquete
    SUB AX,25                                       ;Raio da bolinha
    CMP [BALL_X],AX                                 ;Compara se Ball_x < raquete_x
    JL  PularComparacaoRaqueteDir                   ;Se Ball_x < raquete_x => sem colisão   
        MOV AX,[ballSpeed_X]
        CMP [ballCompDirecaoNeg],AX                 ;não colide se a bolinha estiver indo para esquerda
        JE  PularComparacaoRaqueteDir
            MOV AX,[raquete_direita+2]
            CMP AX,[BALL_Y]                             ;Verifica se a bola está aabixo da parte de baixo da raquete
            JG PularComparacaoRaqueteDir                  ;Se a bola estiver abaixo => Pula colisão      
                MOV AX,[raquete_direita+2]
                ADD word AX,84
                CMP AX,[BALL_Y]                         ;Verifica se a bola está mais alto que a parte alta da raquete   
                JL PularComparacaoRaqueteDir              ;Se a bola estiver mais alto => Pula colisão
                    NEG word [ballSpeed_X]        
    PularComparacaoRaqueteDir:

    ;================= Colisão na raquete Esquerda ====================

    MOv AX,[raquete_esquerda+4]                          ;x1 da raquete
    ADD AX,25                                       ;Raio da bolinha
    CMP [BALL_X],AX                                 ;Compara se Ball_x < raquete_x
    JG  PularComparacaoRaqueteEsq                   ;Se Ball_x < raquete_x => sem colisão
        MOV AX,[ballSpeed_X]                        ;Não colide se a bolinha estiver indo para esquerda
        CMP [ballCompDirecao],AX
        JE  PularComparacaoRaqueteEsq
            MOV AX,[raquete_esquerda+2]
            CMP AX,[BALL_Y]                             ;Verifica se a bola está aabixo da parte de baixo da raquete
            JG PularComparacaoRaqueteEsq                  ;Se a bola estiver abaixo => Pula colisão
                MOV AX,[raquete_esquerda+2]
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

;=================Movimento das Raquetes =================

; Controle das raquetes
    mov ah, 01h
    int 16h  
    jnz verificar_teclas
	JMP main_loop  

verificar_teclas:
	IN AL, 60h
    
	CMP AL, 11h   ; Tecla 'W'
	JNE verificar_s
	JMP mover_raquete_esquerda_cima

	verificar_s:
	CMP AL, 1Fh   ; Tecla 'S'
	JNE verificar_cima
	JMP mover_raquete_esquerda_baixo

	verificar_cima:
	CMP AL, 48h   ; Seta para cima
	JNE verificar_baixo
	JMP mover_raquete_direita_cima

	verificar_baixo:
	CMP AL, 50h   ; Seta para baixo
	JNE verificacao_feita
	JMP mover_raquete_direita_baixo

	verificacao_feita:
	JMP main_loop  ; Voltando para o ciclo principal

%define PASSO_RAQUETE 1  ; Define a velocidade da raquete

mover_raquete_esquerda_cima:

    MOV CX,[raqueteSpeed]
    loop_SobeRaquete_Esq:
	; Apaga a trilha anterior (linha preta na direção oposta)
    mov byte [cor], preto  
    mov ax, [raquete_esquerda]
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    mov ax, [raquete_esquerda]
    add ax, 20  
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    call line
    
    ; Move a raquete
    add word [raquete_esquerda+2], 84
    
    ; Desenha a nova posição
    mov byte [cor], magenta
    mov ax, [raquete_esquerda]
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    mov ax, [raquete_esquerda]
    add ax, 20 
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    call line
    sub word [raquete_esquerda+2], 83
    LOOP loop_SobeRaquete_Esq

	JMP main_loop

mover_raquete_esquerda_baixo:
	
    MOV CX,[raqueteSpeed]
    loop_DesceRaquete_Esq:

	sub word [raquete_esquerda+2], PASSO_RAQUETE
    
    mov byte [cor], magenta
    mov ax, [raquete_esquerda]
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    mov ax, [raquete_esquerda]
    add ax, 20  
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    call line

    add word [raquete_esquerda+2], 84

    mov byte [cor], preto  
    mov ax, [raquete_esquerda]
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    mov ax, [raquete_esquerda]
    add ax, 20  
    push ax
    mov ax, [raquete_esquerda+2]
    push ax
    call line
    sub word [raquete_esquerda+2], 84
    LOOP loop_DesceRaquete_Esq

	JMP main_loop

mover_raquete_direita_cima:
    MOV CX,[raqueteSpeed]
    loop_SobeRaquete:

    ; Apaga a trilha anterior (linha preta na direção oposta)
    mov byte [cor], preto  
    mov ax, [raquete_direita]               ;x1
    push ax
    mov ax, [raquete_direita+2]             ;y1
    push ax
    mov ax, [raquete_direita]               ;x2
    add ax, 20  
    push ax
    mov ax, [raquete_direita+2]             ;y2
    push ax
    call line
    
    ; Move a raquete
    add word [raquete_direita+2], 84
    
    ; Desenha a nova posição
    mov byte [cor], azul
    mov ax, [raquete_direita]
    push ax
    mov ax, [raquete_direita+2]
    push ax
    mov ax, [raquete_direita]
    add ax, 20 
    push ax
    mov ax, [raquete_direita+2]
    push ax
    call line
    sub word [raquete_direita+2], 83
    
    LOOP loop_SobeRaquete


	JMP main_loop

mover_raquete_direita_baixo:
	MOV CX,[raqueteSpeed]
    loop_DesceRaquete_Dir:
    
    sub word [raquete_direita+2], PASSO_RAQUETE
    
    mov byte [cor], azul
    mov ax, [raquete_direita]
    push ax
    mov ax, [raquete_direita+2]
    push ax
    mov ax, [raquete_direita]
    add ax, 20  
    push ax
    mov ax, [raquete_direita+2]
    push ax
    call line

    add word [raquete_direita+2], 84

    mov byte [cor], preto  
    mov ax, [raquete_direita]
    push ax
    mov ax, [raquete_direita+2]
    push ax
    mov ax, [raquete_direita]
    add ax, 20  
    push ax
    mov ax, [raquete_direita+2]
    push ax
    call line
    sub word [raquete_direita+2], 84
    LOOP loop_DesceRaquete_Dir

	JMP main_loop


	MOV    	AH,08h
	INT     21h
	MOV  	AH,0   						; set video mode
    MOV  	AL,[modo_anterior]   		; modo anterior
	INT  	10h
	MOV     AX,4c00h
	INT     21h


; -------------------------------------------------------------------
; Exibir Menu com opções destacadas
exibir_menu:
        MOV     byte [selecao], 0  ; Opção inicial
        CALL    imprimir_titulo
        CALL    desenhar_opcoes
        RET

; -------------------------------------------------------------------
; Rotina para capturar entrada do teclado e navegar no menu
selecionar_opcao:
    MOV     AH, 00h   ; Capturar tecla pressionada
    INT     16h
    
    CMP     AL, 13    ; Enter
    JE      confirmar_escolha
    
    CMP     AH, 48h   ; Seta para cima
    JE      mover_cima
    
    CMP     AH, 50h   ; Seta para baixo
    JE      mover_baixo
    
    JMP     selecionar_opcao  ; Continua capturando entrada

mover_cima:
    CMP     byte [selecao], 0
    JE      selecionar_opcao  ; Já no topo, ignora
    DEC     byte [selecao]    ; Move seleção para cima
    CALL    desenhar_opcoes
    JMP     selecionar_opcao

mover_baixo:
    CMP     byte [selecao], 2
    JE      selecionar_opcao  ; Já na última opção, ignora
    INC     byte [selecao]    ; Move seleção para baixo
    CALL    desenhar_opcoes
    JMP     selecionar_opcao

confirmar_escolha:
    ; Dependendo da opção selecionada, chamar rotina específica
    CMP     byte [selecao], 0
    JE      modo_facil
    CMP     byte [selecao], 1
    JE      modo_medio
    CMP     byte [selecao], 2
    JE      modo_dificil

modo_facil:
    ; Implementar lógica do modo fácil
    MOV word [ballSpeed_X],3
    MOV word [ballSpeed_Y],3
    RET
modo_medio:
    ; Implementar lógica do modo médio
    MOV word [ballSpeed_X],9
    MOV word [ballSpeed_Y],9
    RET
modo_dificil:
    ; Implementar lógica do modo difícil
    MOV word [ballSpeed_X],15
    MOV word [ballSpeed_Y],15
    RET

; -------------------------------------------------------------------
; Desenhar opções do menu com destaque

desenhar_opcoes:
    MOV     CX, 9
    MOV     BX, 0
    MOV     DH, 8
    MOV     DL, 30
    MOV     byte [cor], branco_intenso
    
    CMP     byte [selecao], 0
    JNE     normal1
    MOV     byte [cor], verde  ; Destacar opção selecionada
normal1:
    CALL    imprimir_facil
    
    MOV     CX, 9
    MOV     BX, 0
    MOV     DH, 10
    MOV     DL, 30
    MOV     byte [cor], branco_intenso
    
    CMP     byte [selecao], 1
    JNE     normal2
    MOV     byte [cor], verde
normal2:
    CALL    imprimir_medio
    
    MOV     CX, 11
    MOV     BX, 0
    MOV     DH, 12
    MOV     DL, 30
    MOV     byte [cor], branco_intenso
    
    CMP     byte [selecao], 2
    JNE     normal3
    MOV     byte [cor], verde
normal3:
    CALL    imprimir_dificil
    RET

imprimir_titulo:
    MOV     CX, 9
    MOV     BX, 0
    MOV     DH, 6
    MOV     DL, 30
    MOV     byte [cor], amarelo
    MOV     SI, titulo
    CALL    imprimir_texto
    RET

imprimir_facil:
    MOV     SI, facil
    CALL    imprimir_texto
    RET

imprimir_medio:
    MOV     SI, medio
    CALL    imprimir_texto
    RET

imprimir_dificil:
    MOV     SI, dificil
    CALL    imprimir_texto
    RET

imprimir_texto:
    CALL    cursor
    MOV     AL, [BX + SI]
    CALL    caracter
    INC     BX
    INC     DL
    LOOP    imprimir_texto
    RET

; -------------------------------------------------------------------
	
;*******************************************************************

segment data


bola dw 320, 240, 25

raquete_esquerda dw 31,198,51,282
raquete_direita dw 588,198,608,282  ; Raquete direita centralizada

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
ballSpeed_X     dw      5
ballSpeed_Y     DW      5
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
raqueteSpeed        dw  10

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

selecao db 0
titulo db 'PING-PONG SE_I $'
facil db '1 - Facil SE_I $'
medio db '2 - Medio SE_I $'
dificil db '3 - Dificil SE_I $'

BlocosCoordenadas_X    dw  6,90,102,186,198,282,294,378,390,474  ;Y bloco 1(y1,y2), Y bloco 2(y1,y2), Y bloco 3(y1,y2), Y bloco 4(y1,y2), Y bloco 5(y1,y2) 
BlocosCoordenadas_Y    dw  1,21,618,638                         ;X da Dir (x1,x2), X da Esq(x1,x2)


;*************************************************************************
segment stack stack
		DW 		512
stacktop:
