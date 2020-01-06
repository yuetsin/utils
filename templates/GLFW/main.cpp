#include <glad/glad.h>
// this comment avoids stupid clang-format's auto-reordering #includes
#include <GLFW/glfw3.h>
// totally stupid

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <iostream>
#include <random>

size_t windowWidth = 1280, windowHeight = 720;

int main() {

    if ( !glfwInit() ) {
        std::cout << "GLFW could not be initialized... Aborting!!";
        exit( -1 );
    }

    glfwWindowHint( GLFW_CONTEXT_VERSION_MINOR, 3 );
    glfwWindowHint( GLFW_CONTEXT_VERSION_MAJOR, 3 );
    glfwWindowHint( GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE );
    glfwWindowHint( GLFW_RESIZABLE, GLFW_FALSE );

    GLFWwindow* window = glfwCreateWindow( windowWidth, windowHeight, "WindowTitle", nullptr, nullptr );
    if ( !window ) {
        std::cout << "failed to create window.";
        glfwTerminate();
        exit( -1 );
    }
    glfwMakeContextCurrent( window );

    if ( !gladLoadGLLoader( ( GLADloadproc )glfwGetProcAddress ) ) {
        std::cout << "failed to initialize glad.";
        glfwTerminate();
        exit( -1 );
    }

    glViewport( 0, 0, windowWidth, windowHeight );
    glfwSetTime( 0.0 );

    while ( !glfwWindowShouldClose( window ) ) {
        glfwPollEvents();
        glfwSwapBuffers( window );
    }

    glfwTerminate();
    return -1;
}