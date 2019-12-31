if jobruns > jobruns_previous {
	var difference = jobruns - jobruns_previous
	create_popup(x,y-64,string(difference),c_blue,1,3)	
	jobruns_previous = jobruns
}