shader_type canvas_item;

uniform vec4 main_color : source_color = vec4(1.0);
uniform float speed = 1.0;
uniform float intensity = 0.25; // How strong the shapes are

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    vec2 u = f*f*(3.0 - 2.0*f);
    return mix(a, b, u.x) + (c - a)*u.y*(1.0 - u.x) + (d - b)*u.x*u.y;
}

void fragment() {
    vec2 uv = UV * 10.0;
    uv.y += TIME * speed;

    float pattern = noise(uv);
    pattern = step(0.7, pattern); // makes abstract block shapes

    vec3 base = vec3(0.0); // black
    vec3 color = mix(base, main_color.rgb, pattern * intensity);

    COLOR = vec4(color, 1.0);
}
