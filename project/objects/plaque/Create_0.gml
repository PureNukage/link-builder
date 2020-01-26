window_portrait_width = 200
window_portrait_height = 264
window_portraitX = 0 + window_portrait_width
window_portraitY = display_get_gui_height() - window_portrait_height

window_portrait_offsetX = 4
window_portrait_offsetY = 4

window_two_width = 148
window_two_height = 128
window_twoX = (window_portraitX + window_portrait_width) + 16
window_twoY = display_get_gui_height() - window_two_height
window_two_mouseover = false

window_name_width = 148
window_name_height = 32
window_nameX = window_twoX 
window_nameY = window_twoY - 48

window_level_width = 148
window_level_height = 48
window_levelX = window_nameX + 20
window_levelY = window_nameY - window_level_height
window_level_mouseover = false

button_delete_width = 128
button_delete_height = 64
button_deleteX = display_get_gui_width() - button_delete_width - 128
button_deleteY = display_get_gui_height() - button_delete_height
button_delete_string = "Delete"
button_delete_mouseover = false
button_delete_color_free = c_red
button_delete_color_mouseover = c_maroon
button_delete_color_pressed = c_green
button_delete_color = button_delete_color_free

selection = -1
previous_selection = -1
selection_switch = false

node_info = true
node_stats = true