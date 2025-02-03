# Ping-Pong Breakout em Assembly

Este é um jogo de ping-pong desenvolvido em Assembly, onde dois jogadores competem para quebrar os blocos do adversário enquanto defendem sua área. O jogo inclui:

- **Seleção de Dificuldade**: Escolha entre fácil, médio e difícil para ajustar a velocidade da bolinha.
- **Controles Intuitivos**:
  - Jogador 1: Teclas `W` (subir) e `S` (descer).
  - Jogador 2: Setas `↑` (subir) e `↓` (descer).
- **Pausa**: Pressione `P` para pausar e continuar o jogo.
- **Game Over**: Se a bolinha sair da tela, um menu perguntará se deseja reiniciar (`Y`) ou sair (`N`).
- **Finalização**: Pressione `Q` a qualquer momento para sair do jogo (com confirmação).

## Requisitos Técnicos
- Desenvolvido em Assembly x86.
- Utiliza interrupção de teclado `INT 9h` para captura de teclas.
- Interface gráfica simples com blocos coloridos e mensagens de texto.

## Como Executar
1. Compile o código Assembly usando um assembler como NASM.
2. Execute o programa em um ambiente compatível com DOS ou um emulador como DOSBox.
3. Siga as instruções na tela para jogar.

## Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorias ou correções.
