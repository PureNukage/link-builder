size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_kiosk_stand				//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 1						//	Set; holds the number of ports in this item has
portrait = s_portrait_ethereum		//	Set; holds the portrait for this item
name = "Kiosk"

event_inherited()

ports[0,port_x] = topleft_cell_x - 1
ports[0,port_y] = center_cell_y
ports[0,port_x_diff] = ports[0,port_x] - center_cell_x
ports[0,port_y_diff] = ports[0,port_y] - center_cell_y
//ports[1,port_x] = bottomright_cell_x + 1
//ports[1,port_y] = center_cell_y
//ports[1,port_x_diff] = ports[1,port_x] - center_cell_x
//ports[1,port_y_diff] = ports[1,port_y] - center_cell_y

data_held = ds_list_create()
data_held_ids = ds_list_create()

smartcontract = -1
active = false

ports_count_max = 1

data_needed = []

busy = false
line = ds_list_create()

used = false
used_time = -1
used_logo_speedincrease = false
used_logo_speed = 0
used_blocks_play = false
used_blocks_frame = 0

used_alpha_max = 0
used_alpha = 0

decentralized = false
contracts_supporting = ds_list_create()

sonar = false
sonar_size = 0
sonar_cooldown = 5
sonar_time = -1
sonar_alpha = 1

timer = -1

logoX = -1
logoY = y-200
sprite_index = s_eth
image_index = 8
image_speed = 0