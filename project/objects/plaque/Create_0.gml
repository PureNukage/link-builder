window_portrait_width = 200
window_portrait_height = 264
window_portraitX = 0 + window_portrait_width
window_portraitY = display_get_gui_height() - window_portrait_height

window_portrait_offsetX = 4
window_portrait_offsetY = 4

window_two_width = 128
window_two_height = 128
window_twoX = (window_portraitX + window_portrait_width) + 16
window_twoY = display_get_gui_height() - window_two_height

selection = -1
previous_selection = -1
selection_switch = false

node_info = false
node_stats = false