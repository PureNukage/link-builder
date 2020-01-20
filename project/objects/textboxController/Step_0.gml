if !ds_list_empty(message_queue) and current_message == -1 {
	var buffer_encoded = message_queue[| 0]
	var buffer = buffer_base64_decode(buffer_encoded)
	var _text = buffer_read(buffer,buffer_string)
	var _icon = buffer_read(buffer,buffer_s8)
	var _timer = buffer_read(buffer,buffer_s8)
	var _uniqueID = buffer_read(buffer,buffer_s32)
	var box = instance_create_layer(x,y,"Instances",textbox)
	current_message = box
	box.text = _text
	box.icon = _icon
	box.timer = _timer
	box.uniqueID = _uniqueID
	ds_list_delete(message_queue,0)
	with box {
		height = string_height_ext(text,string_height(text)+4,width_max)
		width = string_width_ext(text,string_height(text),width_max)
		x = display_get_gui_width()/2 - width/2
		iconX = x-sprite_get_width(icon)-buffer-8
		iconY = y-(sprite_get_height(icon)/2)+(height/2)+iconBuffer
	}
}

if input.mouse_left_press and messages_open and !shop.menu_mouseover and !shop.button_mouseover and !messages_mouseover {
	messages_open = false
	clickfix = true
}