# INF01047 - Trabalho Final - Fireplane
Repositório para o trabalho final da cadeira INF01047 - Fundamentos de Computação Gráfica.

**Autores:**
- Arthur Olinto Dossena - 00325370
- Diogo Brum Rivoire - 00344735

# Contribuições
Arthur Olinto Dossena:
- Carregamento dos objetos e texturas
- Instanciação dos objetos
- Interpolação de Phong
- Modelo de iluminação difusa (árvores, chão e avião) e Blinn-Phong (lago)
- Animação de textura (lago)
- Câmera livre
- Movimentação dos objetos
- Lógica de gameplay
Diogo Brum Rivoire:
- Colisões
- Menu de Game Over e Mecânicas de Restart
- Curva de Beziér Cúbica
- Câmera look-at (cutscene inicial)
- Interpolação de Gouraud
- Testes

# Relatório

# Imagens
![image](https://github.com/user-attachments/assets/22e0c373-2b75-43ad-9932-dd0d467d94b9)
![image](https://github.com/user-attachments/assets/5465af22-78d2-49f0-99c6-32d13f3e7ef2)

# Manual de Instruções
**Movimento do Mouse** - Controle de câmera e direcionamento da movimentação frontal do avião

**W** - Aumenta a velocidade frontal do avião após a cutscene inicial

**A** - Movimenta e rotaciona o avião para a esquerda após a cutscene inicial

**D** - Movimenta e rotaciona o avião para a direita após a cutscene inicial

**SPACE** - Libera água armazenada pelo avião

**R** - Reinicia o jogo quando acontecer Game Over

**Q** - Fecha o jogo quando acontecer Game Over

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
