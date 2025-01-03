#ifndef COLLISIONS_H
#define COLLISIONS_H

#include <glm/glm.hpp>

bool checkCollisionWithPlane(glm::vec3 airplane_position, float airplane_radius, glm::vec3 plane_position, float plane_height);
bool checkCollisionWithTree(glm::vec3 airplane_position, float airplane_radius, glm::vec3 tree_position, float tree_radius);

#endif // COLLISIONS_H
