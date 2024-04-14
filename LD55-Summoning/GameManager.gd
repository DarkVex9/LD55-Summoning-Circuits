extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var RuneNorth:Sprite2D = get_tree().get_root().get_node("Main/MainField/CircleOutline/Connectable/RuneNorth")
	RuneNorth.setGameManager(self)
	RuneNorth.setGlyph("F")
	RuneNorth.setPads("T","L")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

 
