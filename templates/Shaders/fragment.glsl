

#version 330 core

struct Material {

    sampler2D diffuse;   /* 漫反射贴图 */
    sampler2D specular;  /* 镜面光贴图 */
    float     shininess; /* 反光度 */
};

struct Light {
    vec3 position; /* 光源位置 */
    vec3 ambient;  /* 环境光照强度 */
    vec3 diffuse;  /* 漫反射光照·强度 */
    vec3 specular; /* 镜面光照强度 */
};

in vec3 FragPos;   /* 输入，接收片段位置向量 */
in vec3 Normal;    /* 输入，顶点接收法向量 */
in vec2 TexCoords; /* 输入，(漫反射)纹理坐标 */

out vec4 FragColor; /* 输出，指定片段颜色 */

uniform Material material; /* 材质属性变量 */
uniform Light light;       /* 光照属性变量 */

uniform vec3 viewerPos; /* 观察者位置向量 */

void main() {}
