varying vec2 v_vTexcoord;

uniform vec2 u_light_pos;
uniform float u_radius;
uniform float u_softness;

void main()
{
    vec2 pixel_pos = gl_FragCoord.xy;
    float dist = distance(pixel_pos, u_light_pos);

	float darkness = smoothstep(
	    u_radius * 0.55,
	    u_radius,
	    dist
	);

    gl_FragColor = vec4(0.0, 0.0, 0.0, darkness);
}