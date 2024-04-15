extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var RuneNorth:Sprite2D = get_tree().get_root().get_node("Main/MainField/CircleOutline/Connectable/RuneNorth")
	RuneNorth.setGameManager(self)
	RuneNorth.setGlyph("F")
	RuneNorth.setPads("T","L")
	var TestWire:Sprite2D = get_tree().get_root().get_node("Main/MainField/CircleOutline/Connectable/WireMid1")
	TestWire.set_availible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

 

#Run Button
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("simulation_start")

func _on_area_2d_mouse_entered():
	pass # Replace with function body.

func _on_area_2d_mouse_exited():
	pass # Replace with function body.
