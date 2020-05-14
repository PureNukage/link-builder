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
body_colors[4] = make_color_rgb(67,193,167)
body_colors[5] = make_color_rgb(130,62,67)

legs_colors[0] = make_color_rgb(98,98,98)
legs_colors[1] = make_color_rgb(63,15,0)
legs_colors[2] = make_color_rgb(10,1,65)
legs_colors[3] = make_color_rgb(32,20,37)
legs_colors[4] = make_color_rgb(145,116,95)


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

var Enum = hero.krown
var name = "Krown"
var String = "Build two of the Trading Contracts"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_krown
var sprite_head = s_hero_krown_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.aaronwright
var name = "Aaron"
var String = "Build the Openlaw Contract"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_aaronwright
var sprite_head = s_hero_aaronwright_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.pomp
var name = "Pomp"
var String = "Have a BTC/USD Price Feed with 3 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_pomp
var sprite_head = s_hero_pomp_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.andreas
var name = "Andreas A."
var String = "Have a BTC/USD Price Feed with 6 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_andreas
var sprite_head = s_hero_andreas_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.satoshi
var name = "Satoshi"
var String = "Have a BTC/USD Price Feed with 9 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_satoshi
var sprite_head = s_hero_satoshi_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.coventry
var name = "Coventry"
var String = "Have a LINK/USD Price Feed with 6 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_coventry
var sprite_head = s_hero_coventry_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.sergey
var name = "Sergey"
var String = "Have a LINK/USD Price Feed with 9 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_sergey
var sprite_head = s_hero_sergey_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.vitalik
var name = "Vitalik"
var String = "Have a ETH/USD Price Feed with 9 APIs"
var available = true
var acquired = false
var hidden = true
var sprite = s_hero_vitalik
var sprite_head = s_hero_vitalik_head
create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

//var Enum = hero.gaben
//var name = "Gaben"
//var String = "Build the eSports Tournament Contract"
//var available = false
//var acquired = false
//var hidden = true
//var sprite = s_hero_gaben
//var sprite_head = s_hero_gaben_head
//create_hero(Enum,name,String,available,acquired,hidden,sprite,sprite_head)

var Enum = hero.duck
var name = "Duck"
var String = "Get a Duck for each Contract using DocuSign"
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

heroSpeech[hero.rory, 0] = "Check the Pivotal Tracker"
heroSpeech[hero.rory, 1] = "Chainlink is cool!"

heroSpeech[hero.thomas, 0] = "If you're a developer check out docs.chain.link"

heroSpeech[hero.adelyn, 0] = "AI is the future!"

heroSpeech[hero.chicocrypto, 0] = "Cheers, I'll see ya next time"

heroSpeech[hero.pomp, 0] = "How large is your cash position?"

heroSpeech[hero.aaronwright, 0] = "Check out The LAO"

heroSpeech[hero.cz, 0] = "Funds are safu"

heros_talking = 0
heros_talking_max = 2
canTalk = true

hero_newCheck()















