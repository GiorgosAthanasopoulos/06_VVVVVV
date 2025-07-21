shader_type canvas_item;

uniform vec4 main_color : source_color = vec4(1.0);
uniform float speed = 0.5;
uniform float zoom = 12.0;
uniform float wall_thickness = 0.1;
uniform float wall_density = 0.2; // Lower = more open

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

// Returns 0, 1, 2, or 3 — representing 0°, 90°, 180°, or 270° rotation
int get_rotation(vec2 cell) {
    return int(floor(hash(cell * 2.0) * 4.0));
}

vec2 rotate(vec2 uv, int r) {
    if (r == 0) return uv;
    else if (r == 1) return vec2(uv.y, 1.0 - uv.x);
    else if (r == 2) return vec2(1.0 - uv.x, 1.0 - uv.y);
    else return vec2(1.0 - uv.y, uv.x); // r == 3
}

// Maze direction mask: [top, right, bottom, left]
vec4 get_maze_dirs(vec2 cell) {
    float t = wall_density;
    float h = hash(cell);
    return vec4(
        step(t, fract(h * 1.1)), // top
        step(t, fract(h * 2.3)), // right
        step(t, fract(h * 3.7)), // bottom
        step(t, fract(h * 4.9))  // left
    );
}

void fragment() {
    vec2 uv = UV * zoom;
    uv.y += TIME * speed;

    vec2 cell = floor(uv);
    vec2 local = fract(uv);

    int rot = get_rotation(cell);
    vec2 rotated_local = rotate(local, rot);
    vec4 dirs = get_maze_dirs(cell);

    // Rotate the direction flags to match the cell's rotation
    if (rot == 1) dirs = dirs.yzwx;
    else if (rot == 2) dirs = dirs.zwxy;
    else if (rot == 3) dirs = dirs.wxyz;

    float wall = 0.0;

    if (dirs.x < 0.5 && rotated_local.y > (1.0 - wall_thickness)) wall = 1.0; // top
    if (dirs.z < 0.5 && rotated_local.y < wall_thickness) wall = 1.0;         // bottom
    if (dirs.y < 0.5 && rotated_local.x > (1.0 - wall_thickness)) wall = 1.0; // right
    if (dirs.w < 0.5 && rotated_local.x < wall_thickness) wall = 1.0;         // left

    vec3 base = vec3(0.0);
    vec3 color = mix(base, main_color.rgb, 1.0 - wall); // wall is black

    COLOR = vec4(color, 1.0);
}
