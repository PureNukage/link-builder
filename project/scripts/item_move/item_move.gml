///@param center_cell_x
///@param center_cell_y

center_cell_x = argument[0]
center_cell_y = argument[1]

topleft_cell_x = center_cell_x-floor(size_width/2)
topleft_cell_y = center_cell_y-floor(size_height/2)

bottomright_cell_x = topleft_cell_x + (size_width-1)
bottomright_cell_y = topleft_cell_y + (size_height-1)