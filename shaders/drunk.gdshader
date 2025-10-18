shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float wave_amplitude : hint_range(0.0, 0.05) = 0.015;
uniform float wave_frequency : hint_range(0.0, 20.0) = 6.0;
uniform float wave_speed : hint_range(0.0, 10.0) = 2.0;

uniform float static_intensity : hint_range(0.0, 1.0) = 0.15; // fuerza del ruido
uniform float static_speed : hint_range(0.0, 10.0) = 4.0;     // qué tan rápido cambia el ruido

// --- función simple de ruido ---
float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = SCREEN_UV;

    // --- Ondulación suave ---
    float wave_x = sin(uv.y * wave_frequency + TIME * wave_speed) * wave_amplitude;
    float wave_y = cos(uv.x * wave_frequency * 0.5 + TIME * wave_speed * 1.2) * wave_amplitude;
    vec2 distorted_uv = uv + vec2(wave_x, wave_y);

    // --- Color base ---
    vec4 base_color = texture(SCREEN_TEXTURE, distorted_uv);

    // --- Estática tipo TV ---
    float noise = rand(vec2(uv.x * 500.0, uv.y * 500.0 + TIME * static_speed));
    noise = (noise - 0.5) * 2.0; // rango [-1, 1]
    vec3 static_effect = base_color.rgb + noise * static_intensity;

    // --- Salida final ---
    COLOR = vec4(static_effect, 1.0);
}
