shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float effect_amount : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    vec4 screen_col = texture(screen_texture, SCREEN_UV);

    float gray = dot(screen_col.rgb, vec3(0.299, 0.587, 0.114));
    vec3 bw = vec3(gray);

    vec3 final_rgb = mix(screen_col.rgb, bw, effect_amount);

    COLOR = vec4(final_rgb, 1.0);
}
