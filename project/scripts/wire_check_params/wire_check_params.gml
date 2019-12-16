///@param ports_list

var ports_list = argument[0]

var this_is_fine = true

//	Check if we should be a corner or straight piece

if ds_list_size(ports_list) == 1 {
	if straight == false {
		straight = true
	}
	
	//	If horizontal
	if directions[right] or directions[left] {
		if abs(rotation) == 90 or abs(rotation) == 270 {
				
		}
	}
	
}

if straight == true {
	
	//	Check if 
	
	switch(rotation)
	{
		case 0:
		case 360:
			
		break
		case -90:
		case 270:
		
		break
		case -180:
		case 180:
		
		break
		case -270:
		case 90:
		
		break
	}
	
} else {
	
	
}