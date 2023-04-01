shader_type canvas_item;

// Allows us to assign a normal map to the shader in the Inspector
uniform sampler2D normal_map;

void fragment() {
	NORMAL = 2.0 * texture(normal_map, UV).rgb - 1.0;
}
