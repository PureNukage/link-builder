window_portraitX = 0 + window_portrait_width
window_portraitY = display_get_gui_height() - window_portrait_height

window_twoX = (window_portraitX + window_portrait_width) + 16
window_twoY = display_get_gui_height() - window_two_height

window_nameX = window_twoX 
window_nameY = window_twoY - 48

window_levelX = window_nameX
window_levelY = window_nameY - window_level_height

button_deleteX = display_get_gui_width() - button_delete_width - 128
button_deleteY = display_get_gui_height() - button_delete_height