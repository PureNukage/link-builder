mouse_left_press = mouse_check_button_pressed(mb_left)
mouse_left = mouse_check_button(mb_left)
mouse_left_release = mouse_check_button_released(mb_left)

mouse_right_press = mouse_check_button_pressed(mb_right)
mouse_right = mouse_check_button(mb_right)

space = keyboard_check_pressed(vk_space)

rotate_right = keyboard_check_pressed(ord("E")) //or mouse_wheel_down()
rotate_left = keyboard_check_pressed(ord("Q")) //or mouse_wheel_up()

delete_press = keyboard_check_pressed(vk_delete)

control_press = keyboard_check_pressed(vk_control)

selection = -1
selections = ds_list_create()
selection_x1 = -1
selection_y1 = -1
selection_x2 = -1
selection_y2 = -1
selection_cell_x1 = -1
selection_cell_y1 = -1
selection_cell_x2 = -1
selection_cell_y2 = -1
selection_timer = -1

grid_x = -1
grid_y = -1
grid_xprevious = -1
grid_yprevious = -1
grid_moved = false

contract = -1

selection_mode = selection_mode.free