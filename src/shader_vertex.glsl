#version 330 core

// Atributos de vértice recebidos como entrada ("in") pelo Vertex Shader.
// Veja a função BuildTrianglesAndAddToVirtualScene() em "main.cpp".
layout (location = 0) in vec4 model_coefficients;
layout (location = 1) in vec4 normal_coefficients;
layout (location = 2) in vec2 texture_coefficients;

// Matrizes computadas no código C++ e enviadas para a GPU
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

// Variável para indicar se gouraud deve ser usado no objeto
uniform bool gouraud_shading_uniform;


// Atributos de vértice que serão gerados como saída ("out") pelo Vertex Shader.
// ** Estes serão interpolados pelo rasterizador! ** gerando, assim, valores
// para cada fragmento, os quais serão recebidos como entrada pelo Fragment
// Shader. Veja o arquivo "shader_fragment.glsl".
out vec4 position_world;
out vec4 position_model;
out vec4 normal;
out vec2 texcoords;
out vec4 gouraud_color;

void main()
{
    // A variável gl_Position define a posição final de cada vértice
    // OBRIGATORIAMENTE em "normalized device coordinates" (NDC), onde cada
    // coeficiente estará entre -1 e 1 após divisão por w.
    // Veja {+NDC2+}.
    //
    // O código em "main.cpp" define os vértices dos modelos em coordenadas
    // locais de cada modelo (array model_coefficients). Abaixo, utilizamos
    // operações de modelagem, definição da câmera, e projeção, para computar
    // as coordenadas finais em NDC (variável gl_Position). Após a execução
    // deste Vertex Shader, a placa de vídeo (GPU) fará a divisão por W. Veja
    // slides 41-67 e 69-86 do documento Aula_09_Projecoes.pdf.

    gl_Position = projection * view * model * model_coefficients;

    // Como as variáveis acima  (tipo vec4) são vetores com 4 coeficientes,
    // também é possível acessar e modificar cada coeficiente de maneira
    // independente. Esses são indexados pelos nomes x, y, z, e w (nessa
    // ordem, isto é, 'x' é o primeiro coeficiente, 'y' é o segundo, ...):
    //
    //     gl_Position.x = model_coefficients.x;
    //     gl_Position.y = model_coefficients.y;
    //     gl_Position.z = model_coefficients.z;
    //     gl_Position.w = model_coefficients.w;
    //

    // Agora definimos outros atributos dos vértices que serão interpolados pelo
    // rasterizador para gerar atributos únicos para cada fragmento gerado.

    // Posição do vértice atual no sistema de coordenadas global (World).
    position_world = model * model_coefficients;

    // Posição do vértice atual no sistema de coordenadas local do modelo.
    position_model = model_coefficients;

    // Normal do vértice atual no sistema de coordenadas global (World).
    // Veja slides 123-151 do documento Aula_07_Transformacoes_Geometricas_3D.pdf.
    normal = inverse(transpose(model)) * normal_coefficients;
    normal.w = 0.0;

    // Coordenadas de textura obtidas do arquivo OBJ (se existirem!)
    texcoords = texture_coefficients;
	
	if (gouraud_shading_uniform) {
        vec4 origin = vec4(0.0, 0.0, 0.0, 1.0);
        vec4 position_camera = inverse(view) * origin;

        vec3 Ks = vec3(0.8, 0.8, 0.8);
        vec3 Kd = vec3(0.54, 0.45, 0.0);
        float q = 80.0;
        
        // Calcula o vetor que representa a direção da câmera em relação ao ponto do vértice
        vec4 v = normalize(position_camera - position_world);

        // Calcula o vetor que representa a direção da fonte de luz em relação ao ponto do vértice
        vec4 l = v;

        // Calcula o Vetor médio para o modelo de iluminação de Blinn-Phong
        vec4 hv = l;

        // Normaliza a normal do vértice para garantir que tenha comprimento unitário
        vec4 n = normalize(normal); 

        // Definite a intensidade espectral da fonte de iluminação
        vec3 I = vec3(1.0,1.0,1.0);

        // Define o espectro da luz ambiente
        vec3 Ia = vec3(0.05, 0.05, 0.05); 

        // Termo difuso utilizando a lei dos cossenos de Lambert
        vec3 lambert_diffuse_term = Kd * I * max(0, dot(n, l)); 

        // Calcula o termo ambiente
        vec3 ambient_term = Kd * Ia; 

        //  Calcula o termo especular utilizando o modelo de iluminação de Blinn-Phong (reflexão especular)
        vec3 blinn_phong_specular_term  = Ks * I * pow(max(0, dot(n, hv)), q); 

        // Calcula o valor de iluminação difusa
        float lambert = max(0, dot(n,l));

		// Combina os termos difuso, ambiente e especular para calcular a cor final do vértice.
        gouraud_color = vec4(lambert_diffuse_term + ambient_term + blinn_phong_specular_term, 1.0); 
    }
}
