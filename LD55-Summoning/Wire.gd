extends Sprite2D

var triggered:bool = false
var selected:bool = false

var areaEnd1:Area2D
var areaEnd2:Area2D
#var collisionEnd1:CollisionShape2D
#var collisionEnd2:CollisionShape2D
var clickArea:Area2D

@export var connections:Array[Sprite2D]

var gameManager:Node

# Called when the node enters the scene tree for the first time.
func _ready():
	#areaEnd1 = get_node("AreaEnd1")
	#areaEnd2 = get_node("AreaEnd2")
	#collisionEnd1 = get_node("AreaEnd1/CollisionShape2D")
	#collisionEnd2 = get_node("AreaEnd2/CollisionShape2D")
	clickArea = get_node("ClickArea")
	clickArea.set_pickable(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_selected(val:bool):
	selected = val
	if val:
		modulate = "30623c"
		#z_index = 0
		#collisionEnd1.set_deferred("disabled",false)
		#collisionEnd2.set_deferred("disabled",false)
	else:
		modulate = "8bac0f"
		#z_index = 10
		#collisionEnd1.set_deferred("disabled",true)
		#collisionEnd2.set_deferred("disabled",true)

#Simulation Stuff
func setGameManager(manager:Node):
	gameManager = manager

func prep_simulation():
	triggered = false

func trigger():
	if not triggered:
		triggered = true
		modulate = "44ddff"
		await get_tree().create_timer(0.2).timeout
		if not gameManager.bonked:
			for thing in connections:
				if not thing == null and thing.has_method("trigger") and not thing.triggered:
					if not "selected" in thing or thing.selected:
						thing.trigger()

func reset():
	z_index = 0
	triggered = false
	if selected:
		modulate = "30623c"
	else:
		modulate = "8bac0f"


func _on_click_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print(event)
		set_selected(not selected)
		gameManager.reset()
	

func _on_click_area_mouse_entered():
	if not triggered:
		if selected:
			modulate = "21532f"
		else:
			modulate = "759600"


func _on_click_area_mouse_exited():
	if not triggered:
		if selected:
			modulate = "30623c"
		else:
			modulate = "8bac0f"
