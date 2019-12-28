//	create surface
surf = surface_create(room_width, room_height)

//	clears the surface, no guarantee a surface doesn't initiate with garbage
surface_set_target(surf)
draw_clear_alpha(c_black, 0)

color0 = make_color_rgb(104,146,165)
color1 = make_color_rgb(47,139,148)
color = color0
color_timer = 25

//	reset to application surface
surface_reset_target()