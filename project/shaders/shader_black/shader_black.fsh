//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.r = 0.0;
	gl_FragColor.g = 0.0;
	gl_FragColor.b = 0.0;
	//gl_FragColor.a = 1.0;
    //gl_FragColor = vec4(v_vColour.rgb, texture2D( gm_BaseTexture, v_vTexcoord ).a);
	//gl_FragColor.rgb = vec3(0.0, 0.0, 0.0);
}