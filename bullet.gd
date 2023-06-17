extends CharacterBody2D

@export var speed = 400
var direction = Vector2.ZERO

func fire_bullet(event_position):
	direction = (event_position - global_position).normalized()
	
func _process(delta):
	var screen_rect = get_viewport().get_visible_rect()
	if (!screen_rect.has_point(global_position)):
		print("Sprite has left the screen.")
		queue_free()

func _physics_process(delta):
	var collision_info = move_and_collide(direction * speed * delta)
	if collision_info:
		direction = direction.bounce(collision_info.get_normal())


