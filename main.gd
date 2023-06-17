extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sheriff.start($StartPosition.position)
	$Bullet.start($StartPosition.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
