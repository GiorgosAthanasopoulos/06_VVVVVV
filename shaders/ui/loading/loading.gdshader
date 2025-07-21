shader_type canvas_item;

uniform float speed = 0.5;     // scroll speed (rows per second)
uniform float bar_height = 0.05; // height of each bar (fraction of screen)
uniform float brightness_dark = 0.3;  // brightness of dark bars
uniform float brightness_light = 1.0; // brightness of light bars

// HSV to RGB helper function
vec3 hsv2rgb(vec3 c) {
    vec3 rgb = clamp( abs(mod(c.x*6.0 + vec3(0.0,4.0,2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void fragment() {
    // Global hue cycles over time (rainbow for whole screen)
    float hue = fract(TIME * 0.1);
    vec3 base_color = hsv2rgb(vec3(hue, 1.0, 1.0));
    
    // Calculate vertical position with scrolling offset
    // TIME * speed gives continuous vertical scroll in units of bars
    float pos = UV.y + TIME * speed;
    
    // Determine which bar we are in
    int bar_index = int(floor(pos / bar_height));
    
    // Every other bar is darker
    float brightness = (bar_index % 2 == 0) ? brightness_light : brightness_dark;
    
    // Final color with brightness applied
    vec3 color = base_color * brightness;
    
    COLOR = vec4(color, 1.0);
}
