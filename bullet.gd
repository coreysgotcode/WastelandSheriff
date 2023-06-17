extends CharacterBody2D

var screen_size # Size of the game window.

@export var speed = 400
var direction = Vector2.ZERO

var target = position
var trigger_pulled = false

func _ready():
	screen_size = get_viewport_rect().size


func _input(event):
	if event.is_action_pressed("click"):
		trigger_pulled = true 
		direction = (event.position - global_position).normalized()


func _physics_process(delta):
	if trigger_pulled:
		var collision_info = move_and_collide(direction * speed * delta)
		if collision_info:
			direction = direction.bounce(collision_info.get_normal())
		

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
