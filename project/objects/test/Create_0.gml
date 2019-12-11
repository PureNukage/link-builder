mygrid = ds_grid_create(5,5)

var i = 0
for(var h=0;h<5;h++) {
	for(var w=0;w<5;w++) {
		mygrid[# w, h] = i
		i++
	}	
}