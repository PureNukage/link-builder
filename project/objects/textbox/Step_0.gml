iconY = wave(y-(sprite_get_height(icon)/2)+(height/2)+iconBuffer,y-(sprite_get_height(icon)/2)+(height/2)-iconBuffer,.5,0)
iconY = round(iconY)

x = display_get_gui_width()/2 - width/2
iconX = x-sprite_get_width(icon)-buffer-8

if fade > -1 {
	fade -= .05
}
if fade == 0 {
	instance_destroy()	
}

if timer > 0 timer--
if timer == 0 {
	fade = 1
	timer = -1
}