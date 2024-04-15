extends Node

@export var runeList:Array[Sprite2D]
var connectableList:Array[Node]


# Called when the node enters the scene tree for the first time.
func _ready():
	connectableList= get_tree().get_root().get_node("Main/MainField/CircleOutline/Connectable").get_children()
	for thing in connectableList:
		if "gameManager" in thing:
			thing.gameManager = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

 

#Run Button
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		runeList[0].trigger()

func _on_area_2d_mouse_entered():
	pass # Replace with function body.

func _on_area_2d_mouse_exited():
	pass # Replace with function body.


func bonk(where:Sprite2D):
	pass
	push_error("Simulation Bonk at "+str(where))

func reset():
	print("reset")
	for thing in connectableList:
		if thing.has_method("reset"):
			thing.reset()
