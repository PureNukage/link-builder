if jobruns > jobruns_previous {
	var difference = jobruns - jobruns_previous
	resource_changed("LINK",-1*(difference*2),x,y-64,false)
	//create_popup(x,y-64,string(difference),c_sergey_blue,1,3)	
	jobruns_previous = jobruns
}