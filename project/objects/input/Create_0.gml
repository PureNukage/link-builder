mouse_left_press = mouse_check_button_pressed(mb_left)
mouse_left = mouse_check_button(mb_left)
mouse_left_release = mouse_check_button_released(mb_left)

mouse_right_press = mouse_check_button_pressed(mb_right)

space = keyboard_check_pressed(vk_space)

rotate_right = keyboard_check_pressed(ord("E")) //or mouse_wheel_down()
rotate_left = keyboard_check_pressed(ord("Q")) //or mouse_wheel_up()

control_press = keyboard_check_pressed(vk_control)

selection = -1
selections = ds_list_create()

grid_x = -1
grid_y = -1
grid_xprevious = -1
grid_yprevious = -1
grid_moved = false