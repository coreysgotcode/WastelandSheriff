extends Node

@export var bullet_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sheriff.start($StartPosition.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("click"):
		var bullet = bullet_scene.instantiate()
		bullet.position = $Sheriff.position
		add_child(bullet)
		bullet.fire_bullet(event.position)
