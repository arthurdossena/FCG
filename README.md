# INF01047 - Trabalho Final - Fireplane
Repositório para o trabalho final da cadeira INF01047 - Fundamentos de Computação Gráfica.

**Autores:**
- Arthur Olinto Dossena - 00325370
- Diogo Brum Rivoire - 00344735

# Contribuições
Arthur Olinto Dossena:
- Rendering
- 
Diogo Brum Rivoire:
- Colisões
- Menu de Game Over e Mecânicas de Restart
- Curva de Beziér Cúbica
- Interpolação Gouraud
- Testes

# Relatório

# Imagens
![image](https://github.com/user-attachments/assets/22e0c373-2b75-43ad-9932-dd0d467d94b9)
![image](https://github.com/user-attachments/assets/5465af22-78d2-49f0-99c6-32d13f3e7ef2)

# Manual de Instruções
**Movimento do Mouse** - Controle de Câmera e Direcionamento da Movimentação Frontal do Avião

**W** - Aumenta a Velocidade Frontal do Avião após a cutscene inicial

**A** - Movimenta e Rotaciona o Avião para a Esquerda após a cutscene inicial

**D** - Movimenta e Rotaciona o Avião para a Direita após a cutscene inicial

**SPACE** - Libera Água Armazenada pelo Avião

**R** - Reinicia o Jogo quando acontecer Game Over

**Q** - Fecha o Jogo quando acontecer Game Over
# Compilação e Execução
**Linux com Makefile:**
Para compilar e executar este projeto no Linux, primeiro você precisa instalar
as bibliotecas necessárias. Para tanto, execute o comando abaixo em um terminal.
Esse é normalmente suficiente em uma instalação de Linux Ubuntu:
 
    sudo apt-get install build-essential make libx11-dev libxrandr-dev \
                         libxinerama-dev libxcursor-dev libxcb1-dev libxext-dev \
                         libxrender-dev libxfixes-dev libxau-dev libxdmcp-dev

Se você usa Linux Mint, talvez seja necessário instalar mais algumas bibliotecas:

    sudo apt-get install libmesa-dev libxxf86vm-dev

Após a instalação das bibliotecas acima, navegue até a pasta raíz do projeto, e execute
o comando "make" para compilar. Para executar o código compilado, execute o
comando "make run".
