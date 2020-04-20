people = ds_list_create()

population = ds_list_size(people)

needed_population = 0

spawners = ds_list_create()

heromenu_active = true

for(var i=0;i<4;i++) {
	switch(i)
	{
		case 0:		//	Right
			
			var _xx = room_width + 256
			var _yy = room_height/2
			
		break
		case 1:		//	Bottom
		
			var _xx = room_width/2
			var _yy = room_height + 256
		
		break
		case 2:		//	Left
		
			var _xx = -256
			var _yy = room_height/2
		
		break
		case 3:		//	Top
		
			var _xx = room_width/2
			var _yy = -256
		
		break
	}
	var spawner = instance_create_layer(_xx,_yy,"Instances",personSpawner)	
	spawner.ID = i
	ds_list_add(spawners,spawner)
}

hair_colors[0] = make_color_rgb(185,122,87)
hair_colors[1] = make_color_rgb(109,68,46)
hair_colors[2] = make_color_rgb(44,27,18)
hair_colors[3] = make_color_rgb(255,255,191)

head_colors[0] = make_color_rgb(255,215,172)
head_colors[1] = make_color_rgb(234,222,176)
head_colors[2] = make_color_rgb(129,99,69)
head_colors[3] = make_color_rgb(193,167,142)

body_colors[0] = make_color_rgb(53,164,91)
body_colors[1] = make_color_rgb(53,121,164)
body_colors[2] = make_color_rgb(159,49,6)
body_colors[3] = make_color_rgb(90,4,163)

legs_colors[0] = make_color_rgb(98,98,98)
legs_colors[1] = make_color_rgb(63,15,0)
legs_colors[2] = make_color_rgb(10,1,65)
legs_colors[3] = make_color_rgb(32,20,37)

//	Heros
hero_check_timer = 15
hero_check_time = time.stream + hero_check_timer

hero_menu_open = false

hero_surface = -1
hero_surface_offsetY = 0
hero_mouseover = false

new_hero = 0
button_color = c_white
button_glow = false
button_timer = 0
button_timer_flip = 45
button_color_0 = c_white
button_color_1 = c_yellow

heros = 0
var Enum = hero.rory
var name = "Rory"
var String = "Get Cerberus Wallet 2FA and Backerr Online"
var available = true
var acquired = false
var hidden = false
var sprite = s_hero_rory
var sprite_head = s_hero_rory_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.adelyn
var name = "Adelyn"
var String = "Get all the Hackathon projects up"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_adelyn
var sprite_head = s_hero_adelyn_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.thomas
var name = "Thomas"
var String = "Have an ETH/USD Price Feed with 3 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_thomas
var sprite_head = s_hero_thomas_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.chicocrypto
var name = "Chico Crypto"
var String = "Get the Revenue Share Contract Online"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_chicocrypto
var sprite_head = s_hero_chicocrypto_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.cz
var name = "CZ"
var String = "Use all Binance APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_cz
var sprite_head = s_hero_cz_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.duck
var name = "Duck"
var String = "Use the DocuSign API"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_duck
var sprite_head = s_hero_duck_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.pepe
var name = "Frog"
var String = "Hold at least 1000 LINK"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_pepe
var sprite_head = s_hero_pepe_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

hero_newCheck()















