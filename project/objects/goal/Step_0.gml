//if myperson == -1 {
//	for(var p=0;p<ds_list_size(personController.people);p++) {
//		var Person = personController.people[| p]	
//		if Person.goal_current == id {
//			myperson = Person	
//		}
//	}
//	//	No people have me as a goal!
//	if myperson == -1 {
//		instance_destroy()
//	}
//} else {
//	if !instance_exists(myperson) myperson = -1
//	else {
//		if myperson.goal_current != id myperson = -1	
//	}
//}