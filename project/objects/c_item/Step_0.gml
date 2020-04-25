switch(states)
{
	#region State Placement
		case states.placement:
		
			if input.mouse_right_press and !(app.tutorial == tutorial.basics and tutorialHelper.stage < 7) {
				if ds_list_find_index(input.selections,id) > -1 {
					ds_list_delete(input.selections,id)
				}
				if input.selection == id input.selection = -1	
			}
		
			if input.grid_x != -1 and input.grid_y != -1 {
		
				if input.grid_moved {
					if !multireplace item_move(input.grid_x,input.grid_y)
					else {
						var XX = input.grid_x + multireplace_offsetX
						var YY = input.grid_y + multireplace_offsetY
						if XX > -1 and XX < grid_width and YY > -1 and YY < grid_height item_move(XX,YY)
						else placeable = false
					}
				}
				
				//	Rotation
				if (input.rotate_right or input.rotate_left) and !multireplace {
					var _direction = input.rotate_right - input.rotate_left
					if _direction == 1 {
						rotation -= 90
					} else {
						rotation += 90
					}
					size_width = size_width + size_height
					size_height = size_width - size_height
					size_width = size_width - size_height
					//Cells
					center_cell_x = input.grid_x
					center_cell_y = input.grid_y

					topleft_cell_x = center_cell_x-floor(size_width/2)
					topleft_cell_y = center_cell_y-floor(size_height/2)

					bottomright_cell_x = topleft_cell_x + (size_width-1)
					bottomright_cell_y = topleft_cell_y + (size_height-1)
				}
				
			}
		
		break
	#endregion
	
	#region State Placed
		case states.placed:		
			
			item_index_priority()
			
			if selected and input.delete_press and app.tutorial == -1 {				
				item_delete()				
			}
			
		break
	#endregion
}

depth = -y