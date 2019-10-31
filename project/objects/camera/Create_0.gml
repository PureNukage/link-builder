room_set_view_enabled(0,true)

view_enabled = true
view_set_visible(0,true)

view_set_wport(0,1280)
view_set_hport(0,720)

cam = camera_create_view(0,0,1280,720,0,id,200,200,1280,720)

view_set_camera(0,cam)

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

panspeed = 10

zoom_level = 1
default_zoom_width = camera_get_view_width(cam)
default_zoom_height = camera_get_view_height(cam)