extends CharacterBody2D


func flip_arm(flip_h):
	$AnimatedSprite2D.flip_v = false
	# See the note below about boolean assignment.
	print(flip_h)
	$AnimatedSprite2D.flip_h = flip_h
	if flip_h:
		position.x = position.x * -1
	else:
		position.x = abs(position.x)

func _physics_process(delta):
	pass
	

	
	
