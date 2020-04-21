if input.alt vision = !vision

//	Activate all elements once player clicks the first SN Event
if app.tutorial == -1 and textbox_in_history(77) {
	shop.wire_active = true
	shop.resources_active = true
	topmenu.data_active = true
	topmenu.nodes_active = true
	topmenu.contracts_active = true
	personController.heromenu_active = true
	textboxController.draw_active = true
	
	//shop.resources_active = false
	//shop.wire_active = false
	//topmenu.data_active = false
	//topmenu.nodes_active = false
	//topmenu.contracts_active = false
	
}

if player.money < 0 and !in_debt {
	in_debt = true
}

if in_debt {
	if player.money > 0 {
		in_debt = false
		in_debt_timer = irandom_range(120,180)	
	}
	if in_debt_timer > 0 in_debt_timer--
	else { 
		//	Trigger the First Bailout
		if player.money < (bailout1_amount_trigger*-1) and bailout1_amount_net == -1 {
			bailout1_amount_net = abs(player.money)
			bailout2_amount_trigger = bailout1_amount_net
			resource_changed("$$",-bailout1_amount,app.resolution_width/2,app.resolution_height/2,true)
			create_textbox("Mr. SN has given you a $"+string(bailout1_amount)+" bailout. You only have one more of these.",s_event_sn)
		}
		
		//	Trigger the Second bailout
		if player.money < (bailout2_amount_trigger*-1) and bailout2_amount_net == -1 {
			bailout2_amount_net = abs(player.money)
			lose_game_trigger = bailout2_amount_net
			resource_changed("$$",-bailout2_amount,app.resolution_width/2,app.resolution_height/2,true)
			create_textbox("Mr. SN tosses you $"+string(bailout2_amount)+". You're on your own from here",s_event_sn)
		}
		
		//	Check for losing the game
		if player.money < (lose_game_trigger*-1) and bailout2_amount_net > -1 and !game_over {
			game_over = true
			create_textbox("Mr. SN has left as an investor. This truly is the darkest timeline.",s_event_gameover)
		}
		
		if game_over {
			if game_over_timer > 0 game_over_timer--
			else {
				create_textbox("Press OK to return to the Main Menu",-1,-1,123456789)
			}
			
			if textbox_in_history(123456789) {
				back_to_mainmenu()
				exit
			}
		}
		
		if player.money > 0 {
			in_debt = false
			in_debt_timer = irandom_range(120,180)	
		}
			
	}
}