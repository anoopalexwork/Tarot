extends Node2D

var rwPics = []
var msPics = []
var rWoodPics = []
var deck
var tempcard
var selected
var v
var s
var c
#var sprite
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	loadRW()
	loadMS()
	loadRWood()
	
	deck = rWoodPics
	

func loadRWood():
	var picNames = ["00.jpeg","01.jpeg","02.jpeg","03.jpeg","04.jpeg","05.jpeg","06.jpeg","07.jpeg","08.jpeg","09.jpeg","10.jpeg","11.jpeg","12.jpeg","13.jpeg","14.jpeg","15.jpeg","16.jpeg","17.jpeg","18.jpeg","19.jpeg","20.jpeg","21.jpeg","Coins001.jpeg","Coins002.jpeg","Coins003.jpeg","Coins004.jpeg","Coins005.jpeg","Coins006.jpeg","Coins007.jpeg","Coins008.jpeg","Coins009.jpeg","Coins010.jpeg","Coins011.jpeg","Coins012.jpeg","Coins013.jpeg","Coins014.jpeg","Cup001.jpeg","Cup002.jpeg","Cup003.jpeg","Cup004.jpeg","Cup005.jpeg","Cup006.jpeg","Cup007.jpeg","Cup008.jpeg","Cup009.jpeg","Cup010.jpeg","Cup011.jpeg","Cup012.jpeg","Cup013.jpeg","Cup014.jpeg","Staff001.jpeg","Staff002.jpeg","Staff003.jpeg","Staff004.jpeg","Staff005.jpeg","Staff006.jpeg","Staff007.jpeg","Staff008.jpeg","Staff009.jpeg","Staff010.jpeg","Staff011.jpeg","Staff012.jpeg","Staff013.jpeg","Staff014.jpeg","Swords001.jpeg","Swords002.jpeg","Swords003.jpeg","Swords004.jpeg","Swords005.jpeg","Swords006.jpeg","Swords007.jpeg","Swords008.jpeg","Swords009.jpeg","Swords010.jpeg","Swords011.jpeg","Swords012.jpeg","Swords013.jpeg","Swords014.jpeg"]
	var path = "res://Cards/RWood/"
	
	for pic in picNames: 
		var sprite = Sprite2D.new()
		sprite.texture=ResourceLoader.load(path+pic)
		sprite.centered=false
		sprite.position = Vector2(0,0)
		sprite.visible = false
		
		rWoodPics.append(sprite)
		add_child(rWoodPics[len(rWoodPics)-1])
		
	rWoodPics.shuffle()
	selected=0

func loadMS():
	var picNames = ["a01.jpg","a02.jpg","a03.jpg","a04.jpg","a05.jpg","a06.jpg","a07.jpg","a08.jpg","a09.jpg","a10.jpg","a11.jpg","a12.jpg","a13.jpg","a14.jpg","a15.jpg","a16.jpg","a17.jpg","a18.jpg","a19.jpg","a20.jpg","a21.jpg","a22.jpg","b01.jpg","b02.jpg","b03.jpg","b04.jpg","b05.jpg","b06.jpg","b07.jpg","b08.jpg","b09.jpg","b10.jpg","b11.jpg","b12.jpg","b13.jpg","b14.jpg","c01.jpg","c02.jpg","c03.jpg","c04.jpg","c05.jpg","c06.jpg","c07.jpg","c08.jpg","c09.jpg","c10.jpg","c11.jpg","c12.jpg","c13.jpg","c14.jpg","d01.jpg","d02.jpg","d03.jpg","d04.jpg","d05.jpg","d06.jpg","d07.jpg","d08.jpg","d09.jpg","d10.jpg","d11.jpg","d12.jpg","d13.jpg","d14.jpg","e01.jpg","e02.jpg","e03.jpg","e04.jpg","e05.jpg","e06.jpg","e07.jpg","e08.jpg","e09.jpg","e10.jpg","e11.jpg","e12.jpg","e13.jpg","e14.jpg"]
	var path = "res://Cards/MS/"
	
	for pic in picNames:
		var fname = path+pic 
		var sprite = Sprite2D.new()
		sprite.texture=ResourceLoader.load(path+pic)
		sprite.centered=false
		sprite.position = Vector2(0,0)
		sprite.visible = false
		
		msPics.append(sprite)
		add_child(msPics[len(msPics)-1])
		
	msPics.shuffle()
	selected=0
	#for card in cards:
		#card.flip_v = true
func loadRW():
	var picNames = ["00-TheFool.jpg","01-TheMagician.jpg","02-TheHighPriestess.jpg","03-TheEmpress.jpg","04-TheEmperor.jpg","05-TheHierophant.jpg","06-TheLovers.jpg","07-TheChariot.jpg","08-Strength.jpg","09-TheHermit.jpg","10-WheelOfFortune.jpg","11-Justice.jpg","12-TheHangedMan.jpg","13-Death.jpg","14-Temperance.jpg","15-TheDevil.jpg","16-TheTower.jpg","17-TheStar.jpg","18-TheMoon.jpg","19-TheSun.jpg","20-Judgement.jpg","21-TheWorld.jpg","Cups01.jpg","Cups02.jpg","Cups03.jpg","Cups04.jpg","Cups05.jpg","Cups06.jpg","Cups07.jpg","Cups08.jpg","Cups09.jpg","Cups10.jpg","Cups11.jpg","Cups12.jpg","Cups13.jpg","Cups14.jpg","Pentacles01.jpg","Pentacles02.jpg","Pentacles03.jpg","Pentacles04.jpg","Pentacles05.jpg","Pentacles06.jpg","Pentacles07.jpg","Pentacles08.jpg","Pentacles09.jpg","Pentacles10.jpg","Pentacles11.jpg","Pentacles12.jpg","Pentacles13.jpg","Pentacles14.jpg","Swords01.jpg","Swords02.jpg","Swords03.jpg","Swords04.jpg","Swords05.jpg","Swords06.jpg","Swords07.jpg","Swords08.jpg","Swords09.jpg","Swords10.jpg","Swords11.jpg","Swords12.jpg","Swords13.jpg","Swords14.jpg","Wands01.jpg","Wands02.jpg","Wands03.jpg","Wands04.jpg","Wands05.jpg","Wands06.jpg","Wands07.jpg","Wands08.jpg","Wands09.jpg","Wands10.jpg","Wands11.jpg","Wands12.jpg","Wands13.jpg","Wands14.jpg"]
	var path = "res://Cards/RW/"
	
	for pic in picNames:
		var fname = path+pic 
		var sprite = Sprite2D.new()
		sprite.texture=ResourceLoader.load(path+pic)
		sprite.centered=false
		sprite.position = Vector2(0,0)
		sprite.visible=false
		rwPics.append(sprite)
		add_child(rwPics[len(rwPics)-1])
		
	rwPics.shuffle()
	selected=0
		
		
func placecard():
	var card =  deck[selected]
	
	card.position = get_local_mouse_position()
	card.z_index = selected
	card.visible = true
	selected+=1
	if selected == 78:
		for i in range(78):
			deck[i].visible=false
			deck[i].z_index = 0
			
		deck.shuffle()
		selected=0
	#
func rebuildDeck():
		for card in deck:
			card.visible=false
			card.z_index = 0
			
		deck.shuffle()
		selected=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_double_click():
		placecard()
	if event is InputEventKey and event.is_action_released("ui_cancel"):
		get_tree().quit()
		
		

func _on_reshuffle_pressed() -> void:
	rebuildDeck()
	$Toolbar/Reshuffle.release_focus()
