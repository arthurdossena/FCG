#include "collisions.h"
#include <cmath>

// Função para verificar colisão entre o avião e o plano~
// COLISÃO ESFERA-PLANO
bool checkCollisionSpherePlane(glm::vec3 airplane_position, float airplane_radius, glm::vec3 plane_position, float plane_height) {
    // Verifica se o avião está abaixo do plano
    return airplane_position.y - airplane_radius <= plane_height;
}

// Função para verificar colisão entre o avião e uma árvore ou entre uma gota de água e uma árvore
// COLISÃO ESFERA-ESFERA
bool checkCollisionSphereSphere(glm::vec3 airplane_position, float airplane_radius, glm::vec3 tree_position, float tree_radius) {
    // Verifica a distância entre o avião e a árvore. Se for menor que a soma dos raios, há colisão
    float distance = glm::distance(airplane_position, tree_position);
    return distance <= (airplane_radius + tree_radius);
}

// Função pra verificar colisão entre o avião e a área de abastecimento do lago.
// COLISÃO PONTO-CUBO
bool checkCollisionPointCube(glm::vec3 point_position, glm::vec3 cube_min, glm::vec3 cube_max) {
    // Verifica se o ponto está dentro dos limites do cubo/paralelepípedo
    return (point_position.x >= cube_min.x && point_position.x <= cube_max.x) &&
           (point_position.y >= cube_min.y && point_position.y <= cube_max.y) &&
           (point_position.z >= cube_min.z && point_position.z <= cube_max.z);
}