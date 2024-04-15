extends Sprite2D

var glyph:Sprite2D
var padTop:Sprite2D
var padRight:Sprite2D
var padLeft:Sprite2D
var padBottom:Sprite2D

var padTopCenter:Sprite2D
var padRightCenter:Sprite2D
var padLeftCenter:Sprite2D
var padBottomCenter:Sprite2D

var padList:Array[Sprite2D]
var enabledPads := {"top":false,"bottom":false,"right":false,"left":false}

var gameManager:Node

var triggered:bool = false
var connection1:Sprite2D
var connection2:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	glyph = get_node("RuneGlyph")
	padTop = get_node("PadTop")
	padLeft = get_node("PadLeft")
	padRight = get_node("PadRight")
	padBottom = get_node("PadBottom")
	
	padTopCenter = padTop.get_node("PadCenter")
	padLeftCenter = padLeft.get_node("PadCenter")
	padRightCenter = padRight.get_node("PadCenter")
	padBottomCenter = padBottom.get_node("PadCenter")
	
	padTopCenter.modulate = "cadc9f"
	padList = [padTop,padRight,padLeft,padBottom]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setGameManager(manager:Node):
	gameManager = manager
	gameManager.connect("simulation_start",_on_simulation_start())

func setGlyph(type:String):
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

func setPads(dir1:String,dir2:String):
	enabledPads.top = false
	enabledPads.bottom = false
	enabledPads.right = false
	enabledPads.left = false
	for pad in padList:
		pad.visible = false
		pad.get_node("Area2D/CollisionShape2D").set_deferred("disabled",true)
	for dir in [dir1,dir2]:
		match dir:
			"T":
				padTop.visible = true
				padTop.get_node("Area2D/CollisionShape2D").set_deferred("disabled",false)
				enabledPads.top = true
			"R":
				padRight.visible = true
				padRight.get_node("Area2D/CollisionShape2D").set_deferred("disabled",false)
				enabledPads.right = true
			"L":
				padLeft.visible = true
				padLeft.get_node("Area2D/CollisionShape2D").set_deferred("disabled",false)
				enabledPads.left = true
			"B":
				padBottom.visible = true
				padBottom.get_node("Area2D/CollisionShape2D").set_deferred("disabled",false)
				enabledPads.bottom = true

func _on_simulation_start():
	triggered = false
	var connectionFound:int
	connection1 = null
	connection2 = null
	if padTop.visible:
		assert(padTop.get_node("Area2D").get_overlapping_areas().size() == 1,"padTop Area2D found the wrong number of areas: "+str(padTop.get_node("Area2D").get_overlapping_areas().size()))
		connection1 = padTop.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()
		connectionFound = 0
	elif padRight.visible:
		assert(padRight.get_node("Area2D").get_overlapping_areas().size() == 1,"padRight Area2D found the wrong number of areas: "+str(padRight.get_node("Area2D").get_overlapping_areas().size()))
		connection1 = padRight.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()
		connectionFound = 1
	elif padLeft.visible:
		assert(padLeft.get_node("Area2D").get_overlapping_areas().size() == 1,"padLeft Area2D found the wrong number of areas: "+str(padLeft.get_node("Area2D").get_overlapping_areas().size()))
		connection1 = padLeft.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()
		connectionFound = 2
	elif padBottom.visible:
		assert(padBottom.get_node("Area2D").get_overlapping_areas().size() == 1,"padBottom Area2D found the wrong number of areas: "+str(padBottom.get_node("Area2D").get_overlapping_areas().size()))
		connection1 = padBottom.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()
		connectionFound = 3
	
	if connectionFound != 1 and padRight.visible:
		assert(padRight.get_node("Area2D").get_overlapping_areas().size() == 1,"padRight Area2D found the wrong number of areas: "+str(padRight.get_node("Area2D").get_overlapping_areas().size()))
		connection2 = padRight.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()
	elif connectionFound != 2 and padLeft.visible:
		assert(padLeft.get_node("Area2D").get_overlapping_areas().size() == 1,"padLeft Area2D found the wrong number of areas: "+str(padLeft.get_node("Area2D").get_overlapping_areas().size()))
		connection2 = padLeft.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()
	elif connectionFound != 3 and padBottom.visible:
		assert(padLeft.get_node("Area2D").get_overlapping_areas().size() == 1,"padLeft Area2D found the wrong number of areas: "+str(padLeft.get_node("Area2D").get_overlapping_areas().size()))
		connection2 = padLeft.get_node("Area2D").get_overlapping_areas()[0].get_parent().get_parent()

#func simulation_trigger(previous:Sprite2D):
#	assert(previous == connection1 or previous == connection2, "Trigger called by disconnected node")
#	await get_tree().create_timer(0.2).timeout
#	if previous == connection1:
#		if connection2 != null:
#			connection2.simulation_trigger(self)

func trigger():
	if leftConnection

func _on_simulation_reset():
	triggered = false
	









