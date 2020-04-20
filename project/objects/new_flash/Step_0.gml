var value = 0.05
if timer > 0 {
	timer--
	if color_glow color = merge_color(color,color_1,value)
	if !color_glow color = merge_color(color,color_0,value)
}
else {
	timer = frames
	color_glow = !color_glow	
}