extends CharacterBody2D


func get_gun_position():
	var tmp_pos = global_position
	tmp_pos.x = tmp_pos.x + 75
	return tmp_pos
	
func get_gun_rotation():
	return global_rotation
	

func get_input():
	look_at(get_global_mouse_position())

func flip_arm(flip_h):
	# See the note below about boolean assignment.
	if flip_h:
		position.x = position.x * -1
	else:
		position.x = abs(position.x)

func _physics_process(delta):
	get_input()
	

	
	
