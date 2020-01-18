x = display_get_gui_width()/2
y = 256

width = 0
height = 0
buffer = 48
crop = 32
text = ""
icon = -1
iconBuffer = 16
iconX = x-sprite_get_width(icon)-buffer-8
iconY = y-(sprite_get_height(icon)/2)+(height/2)+iconBuffer

timer = -1
fade = -1

button_width = 64
button_height = 48
buttonX = x+width/2-button_width
buttonY = y+height + 8
button_string = "OK"
button_mouseover = false

width_max = 348