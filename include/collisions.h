#ifndef COLLISIONS_H
#define COLLISIONS_H

#include <glm/glm.hpp>

bool checkCollisionSpherePlane(glm::vec3 airplane_position, float airplane_radius, glm::vec3 plane_position, float plane_height);
bool checkCollisionSphereSphere(glm::vec3 airplane_position, float airplane_radius, glm::vec3 tree_position, float tree_radius);
bool checkCollisionPointCube(glm::vec3 point_position, glm::vec3 cube_min, glm::vec3 cube_max);

#endif // COLLISIONS_H
