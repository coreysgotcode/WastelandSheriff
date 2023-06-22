extends CharacterBody2D


func _physics_process(delta):
	pass
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
