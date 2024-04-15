extends Sprite2D

var triggered:bool = false
var availible:bool = false
var selected:bool = false

var areaEnd1:Area2D
var areaEnd2:Area2D
var collisionEnd1:CollisionShape2D
var collisionEnd2:CollisionShape2D
var clickArea:Area2D

@export var defaultTexture:Texture2D

var gameManager:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	areaEnd1 = get_node("AreaEnd1")
	areaEnd2 = get_node("AreaEnd2")
	collisionEnd1 = get_node("AreaEnd1/CollisionShape2D")
	collisionEnd2 = get_node("AreaEnd2/CollisionShape2D")
	clickArea = get_node("ClickArea")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_availible(val:bool):
	set_selected(false)
	availible = val
	visible = val
	clickArea.set_pickable(val)

func set_selected(val:bool):
	selected = val
	if val:
		modulate = "30623c"
		collisionEnd1.set_deferred("disabled",false)
		collisionEnd2.set_deferred("disabled",false)
	else:
		modulate = "8bac0f"
		collisionEnd1.set_deferred("disabled",true)
		collisionEnd2.set_deferred("disabled",true)

func setGameManager(manager:Node):
	gameManager = manager

func _on_simulation_start():
	triggered = false


func _on_click_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print(event)
		if availible:
			set_selected(not selected)
	

func _on_click_area_mouse_entered():
	if selected:
		modulate = "21532f"
	else:
		modulate = "759600"


func _on_click_area_mouse_exited():
	if selected:
		modulate = "30623c"
	else:
		modulate = "8bac0f"
