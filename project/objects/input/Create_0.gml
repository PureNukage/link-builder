mouse_left_press = mouse_check_button_pressed(mb_left)
mouse_left = mouse_check_button(mb_left)
mouse_left_release = mouse_check_button_released(mb_left)

mouse_right_press = mouse_check_button_pressed(mb_right)
mouse_right = mouse_check_button(mb_right)

space = keyboard_check_pressed(vk_space)

rotate_right = keyboard_check_pressed(ord("E")) 
rotate_left = keyboard_check_pressed(ord("Q"))

keypress_r = keyboard_check_pressed(ord("R"))

keypress_p = keyboard_check_pressed(ord("P"))

middle_mouse_press = mouse_check_button_pressed(mb_middle)
middle_mouse = mouse_check_button(mb_middle)
middle_mouse_release = mouse_check_button_released(mb_middle)

f5 = keyboard_check_pressed(vk_f5)
f9 = keyboard_check_pressed(vk_f9)

escape = keyboard_check_pressed(vk_escape)

alt = keyboard_check_pressed(vk_alt)

multireplace = false
multireplaceIDs = ds_list_create()
multireplace_placeable = false
centerX = -1
centerY = -1

//	Calculate mouse speed
X = gui_mouse_x
Y = gui_mouse_y
xPrevious = -1
yPrevious = -1

#region wip finger scrolling
	//finger_left_x = device_mouse_x(0)
	//finger_left_y = device_mouse_y(0)
	//finger_left_y_previous = -1
	//finger_left_x_previous = -1

	//finger_right_x = device_mouse_y(1)
	//finger_right_y = device_mouse_y(1)
	//finger_right_y_previous = -1
	//finger_right_x_previous = -1
#endregion

scroll_up = mouse_wheel_up()
scroll_down = mouse_wheel_down()

delete_press = keyboard_check_pressed(vk_delete)

control_press = keyboard_check_pressed(vk_control)

give_money = keyboard_check_pressed(vk_home)

selection = -1
selections = ds_list_create()
ds_list_clear(selections)
selection_x1 = -1
selection_y1 = -1
selection_x2 = -1
selection_y2 = -1
selection_cell_x1 = -1
selection_cell_y1 = -1
selection_cell_x2 = -1
selection_cell_y2 = -1
selection_timer = -1

doubleclick_first = -1
doubleclick = -1
doubleclick_time_diff = 10
doubleclick_time = -1

grid_x = -1
grid_y = -1
grid_xprevious = -1
grid_yprevious = -1
grid_moved = false

contract = -1

selection_mode = selection_mode.free