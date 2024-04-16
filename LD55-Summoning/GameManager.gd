extends Node

@export var runeList:Array[Sprite2D]
@export var nextPuzzle:PackedScene
var connectableList:Array[Node]
var winMessage:Label
var failMessage:Label
var playButton:TextureRect

var started:bool = false
var bonked:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	winMessage = get_node("winLabel")
	winMessage.visible = false
	failMessage = get_node("failLabel")
	failMessage.visible = false
	connectableList = get_tree().get_root().get_node("Puzzle/MainField/CircleOutline/Connectable").get_children()
	playButton = get_tree().get_root().get_node("Puzzle/MainField/RunButton")
	for thing in connectableList:
		if "gameManager" in thing:
			thing.gameManager = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

 
#Run Button
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not started:
			runeList[0].trigger()
			started = true
			playButton.texture = load("res://Assets/playButtonClicked.png")
		else:
			reset()

func _on_area_2d_mouse_entered():
	pass # Replace with function body.

func _on_area_2d_mouse_exited():
	pass # Replace with function body.


func bonk(where:Sprite2D):
	bonked = true
	failMessage.visible = true

func reset():
	print("reset")
	started = false
	bonked = false
	runesLit = 0
	failMessage.visible = false
	playButton.texture = load("res://Assets/playButton.png")
	for thing in connectableList:
		if thing.has_method("reset"):
			thing.reset()

var runesLit:int = 0
var nearBonk:bool = false
func runeLight(rune:Sprite2D):
	if runeList[runesLit] == rune and not nearBonk:
		runesLit+=1
		if runesLit == runeList.size():
			if not nextPuzzle == null:
				winMessage.visible = true
				for i in 4:
					await get_tree().create_timer(0.5).timeout
					winMessage.modulate = "30623c"
					await get_tree().create_timer(0.5).timeout
					winMessage.modulate = "8bac0f"
				get_tree().change_scene_to_packed(nextPuzzle)
			else:
				get_node("victory").visible = true
		nearBonk = true
		await get_tree().create_timer(0.1).timeout
		nearBonk = false
	else:
		bonk(rune)
