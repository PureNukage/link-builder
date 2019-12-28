selection_switch = false

if input.selection > -1 and input.selection != selection {
	selection = input.selection
	
	if selection != previous_selection {
		previous_selection = selection	
		selection_switch = true
	}
} else if input.selection = -1 {
	selection = -1
	previous_selection = -1
}

if selection > -1 {
	
}