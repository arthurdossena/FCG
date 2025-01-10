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
- Curva de Bézier Cúbica
- Câmera look-at (cutscene inicial)
- Interpolação de Gouraud
- Testes

# Relatório
O jogo se chama Fireplane, e tem como gameplay controlar um avião que é conduzido pelo jogador sobre uma floresta apagando  árvores em chamas. De tempos em tempos, um incêndio novo começa em um local aleatório, e se o jogador não buscar água (sobrevoando o lago de perto) e soltá-la sobre a árvore a tempo, ela será destruída. O objetivo é apagar o maior número de incêndios antes da floresta acabar ou de haver alguma colisão. A ferramenta ChatGPT foi utilizado durante o desenvolvimento para identificar origens de bugs e tentar solucioná-los; criar arquivos .obj simples (gota d'água e lago); e tirar dúvidas sobre a sintaxe da linguagem C++ no geral.

O trabalho utilizou como base o código implementado para o Laboratório 5. Assim, os objetos foram incluídos por meio da biblioteca Tiny Object. Com a função LoadTextureImage, todas as imagens, que foram retiradas da internet, puderam ser carregadas no projeto.
Inicialmente, o avião foi adicionado, mas, devido ao seu tamanho original ser demasiadamente grande, muito tempo foi gasto para perceber que o fato de não aparecer na tela se dava por conta da câmera estar dentro dele. Após esse empecilho inicial, o restante do trabalho ocorreu a passos normais.

Utilizando GL_REPEAT nas texturas, foi possível fazer com que o plano se assemelhasse a grama. Depois, as árvores foram adicionadas de forma a serem instâncias múltiplas de um mesmo objeto. Ainda, como algo extra, a textura do lago foi animada para parecer que a água se movimenta conforme o tempo passa, imitando um movimento cíclico de expansão e contração (usando uma função seno). No arquivo shader_fragment, aplicamos a interpolação de Phong na maioria dos objetos. Em geral, eles eram iluminados por meio do modelo de Lambert, exceto o lago, que utilizava Blinn-Phong, e as gotas d'água, que eram discos circulares que sempre estavam virados para a câmera e refletiam uma cor azul constante (a fim de parecer ser uma esfera vista de qualquer ângulo, apesar de ser um círculo plano). Não houve grandes dificuldades na implementação do loop de gameplay, visto que de maneira simples foi possível contar a quantidade de árvores apagadas durante o jogo.

Após isso, implementamos mecânicas de colisões, o que foi relativemente simples. A implementação foi feita verificando se o avião colidia com diferentes objetos, como árvores, o plano e a área de abastecimento de água. O código utiliza funções como checkCollisionSpherePlane para detectar colisões entre o avião e o plano, e checkCollisionSphereSphere para verificar se o avião toca nas árvores ou se gotas d'água encostam nas árvores. Caso ocorra colisão com o plano ou árvores, o jogo é finalizado (Game Over). Quando isso ocorre uma tela de interação é disponibilizada, o código captura as interações do usuário durante o Game Over, permitindo reiniciar o jogo ou encerrar a sessão.

No final do projeto, incluímos uma cutscene inicial. A câmera segue o padrão "Look-At" durante a cutscene, de modo que ela esteja centrada em posição que ela pode acompanhar a chegada do avião. Para a animação do voo do avião durante essa cutscene, foi utilizada uma curva de Bézier cúbica. A posição do avião ao longo da curva é calculada com base em um parâmetro t que varia de 0 a 1, controlando o movimento do avião durante uma cutscene de introdução. A fórmula de Bézier cúbica foi aplicada para definir as posições ao longo do tempo e gerar um voo suave para o avião.


 

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
