//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D tex2;

uniform vec4 M[4];


void main()
{
    mat4 m;
	m[0] = vec4(M[0][0], M[0][1], M[0][2], M[0][3]);
    m[1] = vec4(M[1][0], M[1][1], M[1][2], M[1][3]);
    m[2] = vec4(M[2][0], M[2][1], M[2][2], M[2][3]);
    m[3] = vec4(M[3][0], M[3][1], M[3][2], M[3][3]);
	mat4 matrix;
	matrix[0] = vec4(m[0][0], m[1][0], m[2][0], m[3][0]);
    matrix[1] = vec4(m[0][1], m[1][1], m[2][1], m[3][1]);
    matrix[2] = vec4(m[0][2], m[1][2], m[2][2], m[3][2]);
    matrix[3] = vec4(m[0][3], m[1][3], m[2][3], m[3][3]);
	vec4 offset = vec4(0.0, 0.0, 0.0, 0.0);
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	gl_FragColor = (matrix * color) + offset;
}
