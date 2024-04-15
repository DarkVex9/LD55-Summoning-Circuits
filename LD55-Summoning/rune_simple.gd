extends Sprite2D

var glyph:Sprite2D
var padTop:Sprite2D
var padRight:Sprite2D
var padLeft:Sprite2D
var padBottom:Sprite2D
var padList:Array[Sprite2D]
@export var glyphType:String
@export var enabledPads:Array[bool] = [false,false,false,false]

var triggered:bool = false
@export var leftConnection:Sprite2D
@export var rightConnection:Sprite2D
var gameManager:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	glyph = get_node("RuneGlyph")
	set_glyph(glyphType)
	padTop = get_node("PadTop")
	padLeft = get_node("PadLeft")
	padRight = get_node("PadRight")
	padBottom = get_node("PadBottom")
	padList = [padTop,padRight,padBottom,padLeft]
	for i in 4:
		padList[i].visible = enabledPads[i]
		padList[i].modulate = "cadc9f"
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_glyph(type:String):
	glyph.modulate = "30623c"
	match type:
		"A":
			glyph.set_texture(load("res://Assets/Glyphs/RuneA.png"))
		"C":
			glyph.set_texture(load("res://Assets/Glyphs/RuneC.png"))
		"F":
			glyph.set_texture(load("res://Assets/Glyphs/RuneF.png"))
		"H":
			glyph.set_texture(load("res://Assets/Glyphs/RuneH.png"))
		"I":
			glyph.set_texture(load("res://Assets/Glyphs/RuneI.png"))
		"N":
			glyph.set_texture(load("res://Assets/Glyphs/RuneN.png"))
		"P":
			glyph.set_texture(load("res://Assets/Glyphs/RuneP.png"))
		"R":
			glyph.set_texture(load("res://Assets/Glyphs/RuneR.png"))
		"S":
			glyph.set_texture(load("res://Assets/Glyphs/RuneS.png"))
		"Y":
			glyph.set_texture(load("res://Assets/Glyphs/RuneY.png"))
		_:
			push_error("Invalid Glyph Letter"+str(type))


func trigger():
	triggered = true
	glyph.modulate = "44ddff"
	if (leftConnection == null or leftConnection.triggered) and (rightConnection == null or rightConnection.triggered):
		gameManager.bonk(self)
	elif (leftConnection == null or leftConnection.triggered):
		await get_tree().create_timer(0.2).timeout
		rightConnection.trigger()
	elif (rightConnection == null or rightConnection.triggered):
		await get_tree().create_timer(0.2).timeout
		leftConnection.trigger()

func reset():
	triggered = false
	glyph.modulate = "30623c"
