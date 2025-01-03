#include "collisions.h"
#include <cmath>

// Função para verificar colisão entre o avião e o plano
bool checkCollisionWithPlane(glm::vec3 airplane_position, float airplane_radius, glm::vec3 plane_position, float plane_height) {
    // Verifica se o avião está abaixo do plano
    return airplane_position.y - airplane_radius <= plane_height;
}

// Função para verificar colisão entre o avião e uma árvore
bool checkCollisionWithTree(glm::vec3 airplane_position, float airplane_radius, glm::vec3 tree_position, float tree_radius) {
    // Verifica a distância entre o avião e a árvore. Se for menor que a soma dos raios, há colisão
    float distance = glm::distance(airplane_position, tree_position);
    return distance <= (airplane_radius + tree_radius);
}

