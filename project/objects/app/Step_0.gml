if browser_width != camera.width or browser_height != camera.height {
	with camera{
		width = min(base_width,browser_width)
		height = min(base_height,browser_height)
		scale_canvas(base_width,base_height,width,height,true)	
	}
}