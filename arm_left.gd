extends CharacterBody2D
var _mouse_position = Vector2.ZERO
var last_pos = "aim_right"
var is_left = false

func get_gun_position():
	if is_left:
		return $GunLeft.global_position
	else:
		return null
	
func get_input():
	_mouse_position = get_global_mouse_position()
	
	var _sheriff = get_parent()
	if _mouse_position.x > _sheriff.global_position.x:
		is_left = false
		_sheriff.flip_direction("walk_right")
		flip_arm("aim_right", _mouse_position)
	else:
		is_left = true
		_sheriff.flip_direction("walk_left")
		flip_arm("aim_left", _mouse_position)
		
func flip_arm(direction_str, _mouse_position):
	if direction_str == "aim_left":
		look_at(_mouse_position)
	
	if direction_str != last_pos:
		if direction_str == "aim_left":
			$ArmLeftSprite.show()
		else:
			$ArmLeftSprite.hide()
		last_pos = direction_str

func _physics_process(delta):
	get_input()
	
func start():
	$ArmLeftSprite.hide()
