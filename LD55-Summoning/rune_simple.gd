extends Sprite2D

var glyph:Sprite2D
@export var glyphType:String

var triggered:bool = false
@export var leftConnection:Sprite2D
@export var rightConnection:Sprite2D
var gameManager:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	glyph = get_node("RuneGlyph")
	set_glyph(glyphType)

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
	if leftConnection.triggered and rightConnection.triggered:
		gameManager.bonk(self)
	elif leftConnection.triggered:
		await get_tree().create_timer(0.2).timeout
		rightConnection.trigger()
	elif rightConnection.triggered:
		await get_tree().create_timer(0.2).timeout
		leftConnection.trigger()

func reset():
	triggered = false
	glyph.modulate = "30623c"
