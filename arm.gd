extends CharacterBody2D
var _mouse_position = Vector2.ZERO

func get_gun_position():
	return $Gun.global_position
	
func get_input():
	_mouse_position = get_global_mouse_position()
	look_at(_mouse_position)
	
func flip_arm(flip_h):
	# See the note below about boolean assignment.
	if flip_h:
		position.x = position.x * -1
	else:
		position.x = abs(position.x)

func _physics_process(delta):
	get_input()
