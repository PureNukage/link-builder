width = 3
height = 1

mygrid = ds_grid_create(width,height)

var i = 0
for(var h=0;h<height;h++) {
	for(var w=0;w<width;w++) {
		mygrid[# w, h] = i
		i++
	}	
}