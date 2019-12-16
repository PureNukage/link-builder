///@param ports_list

var ports_list = argument[0]

var this_is_fine = true

//	Check if we should be a corner or straight piece

if ds_list_size(ports_list) == 1 {
	
	ds_list_clear(combinations_corner)
	ds_list_clear(combinations_straight)
	
	if straight == false {
		straight = true
		sprite = sprites[straight]
		debug_log("Changing into a straight piece")
	}
	
	//	If horizontal
	if directions[right] {
		ds_list_add(combinations_straight,0)
	}
	if directions[left] {
		ds_list_add(combinations_straight,180)	
	}
	
	//	If vertical
	if directions[up] {
		ds_list_add(combinations_straight,90)
	}
	if directions[down] {
		ds_list_add(combinations_straight,270)
	}
	
} else if ds_list_size(ports_list) > 1 {
	
	ds_list_clear(combinations_corner)
	ds_list_clear(combinations_straight)
	
	//	Straight pieces
	if directions[right] or directions[left] {
		ds_list_add(combinations_straight,0)
		ds_list_add(combinations_straight,180)	
	}
	if directions[up] or directions[down] {
		ds_list_add(combinations_straight,90)
		ds_list_add(combinations_straight,270)	
	}
	
	//	Corner pieces
	if directions[right] and directions[up] {
		ds_list_add(combinations_corner,0)	
	}
	if directions[right] and directions[down] {
		ds_list_add(combinations_corner,270)	
	}
	if directions[down] and directions[left] {
		ds_list_add(combinations_corner,180)	
	}
	if directions[left] and directions[up] {
		ds_list_add(combinations_corner,90)	
	}
	
	
} else if ports_list == 0 or ds_list_size(ports_list) == 0 {
	
	ds_list_clear(combinations_corner)
	ds_list_clear(combinations_straight)
	
	ds_list_add(combinations_straight,0)
	ds_list_add(combinations_straight,180)	
	ds_list_add(combinations_straight,90)
	ds_list_add(combinations_straight,270)	
	ds_list_add(combinations_corner,0)
	ds_list_add(combinations_corner,270)	
	ds_list_add(combinations_corner,180)	
	ds_list_add(combinations_corner,90)		
}

ds_list_sort(combinations_straight,true)
ds_list_sort(combinations_corner,true)

//	Check that our combo exists