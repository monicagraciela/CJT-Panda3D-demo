#version 330 core

in vec2 fTexCoord;

layout (location = 0) out vec4 fColor;

uniform sampler2D TexDepthStencil;
uniform sampler2D TexDiffuse;
uniform sampler2D TexNormal;
//uniform sampler2D TexSpecular;
//uniform sampler2D TexIrradiance;

uniform sampler2D TexAO;

uniform struct p3d_LightSourceParameters {
    vec4 color;
} AmbientLight;

void main()
{
    vec3 albedo = texture(TexDiffuse, fTexCoord).rgb;
    float ambientOcclusion = texture(TexAO, fTexCoord).r;
    //float ambientOcclusion = 1.0;
    vec4 color = ambientOcclusion * vec4(albedo, 1.0) * AmbientLight.color;

    fColor = color;
}
