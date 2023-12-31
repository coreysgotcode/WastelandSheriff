extends CharacterBody2D
var _mouse_position = Vector2.ZERO
var last_pos = "aim_right"
var is_right = true


func get_gun_position():
	if is_right:
		return $Gun.global_position
	else:
		return null
	
func get_input():
	_mouse_position = get_global_mouse_position()
	look_at(_mouse_position)
	
	var _sheriff = get_parent()

	if _mouse_position.x > _sheriff.global_position.x:
		is_right = true
		_sheriff.flip_direction("walk_right")
		flip_arm("aim_right")
	else:
		is_right = false
		_sheriff.flip_direction("walk_left")
		flip_arm("aim_left")
		
		
func flip_arm(direction_str):
	if direction_str != last_pos:
		if direction_str == "aim_left":
			$ArmSprite.hide()
		else:
			$ArmSprite.show()
		last_pos = direction_str

func _physics_process(delta):
	get_input()
	
	
func start():
	$ArmSprite.show()
